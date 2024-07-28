// @ts-nocheck
const { query } = await Service.import("applications");
const WINDOW_NAME = "applauncher";

/** @param {import('resource:///com/github/Aylur/ags/service/applications.js').Application} app */
const AppItem = app => Widget.Button({
    className: 'searchWindow__item',
    cursor: 'pointer',
    on_clicked: () => {
        App.closeWindow(WINDOW_NAME);
        app.launch();
    },
    attribute: { app },
    child: Widget.Box({
        children: [
            Widget.Icon({
                className: 'icon',
                icon: app.icon_name || "",
            }),
            Widget.Label({
                class_name: "title",
                label: app.name,
                xalign: 0,
                vpack: "center",
                truncate: "end",
            }),
        ],
    }),
});

export const Applauncher = ({ width = 724, height = 800, spacing = 12 }) => {
    // List of application buttons
    let applications = query("").map(AppItem);

    // Container holding the buttons
    const list = Widget.Box({
        className: 'searchWindow__list',
        vertical: true,
        children: applications,
    });

    // Repopulate the box to refresh the list of applications
    const repopulate = () => {
        applications = query("").map(AppItem);
        list.children = applications;
    };

    // Search entry with icon on the right
    const entryWithIcon = Widget.Box({
        className: 'searchWindow__entryWithIcon',
        children: [
            Widget.Entry({
                hexpand: true,
                className: 'searchWindow__entry',
                on_accept: () => {
                    // Launch the first item on Enter
                    const results = applications.filter(item => item.visible);
                    if (results[0]) {
                        App.toggleWindow(WINDOW_NAME);
                        results[0].attribute.app.launch();
                    }
                },
                on_change: ({ text }) => {
                    // Filter the list
                    applications.forEach(item => {
                        item.visible = item.attribute.app.match(text ?? "");
                    });
                },
            }),
            Widget.Icon({
                className: 'searchIcon',
                icon: "search-icon", // Replace with the desired icon name
            }),
        ],
    });

    return Widget.Box({
        vertical: true,
        className: 'searchWindow',
        children: [
            entryWithIcon,
            Widget.Scrollable({
                hscroll: "never",
                css: `min-width: 1000px; min-height: 431px; border-radius: 150px;`,
                child: list,
            }),
        ],
        setup: self => self.hook(App, (_, windowName, visible) => {
            if (windowName !== WINDOW_NAME) return;

            // When the applauncher shows up
            if (visible) {
                repopulate();
                entryWithIcon.children[0].text = "";
                entryWithIcon.children[0].grab_focus();
            }
        }),
    });
};

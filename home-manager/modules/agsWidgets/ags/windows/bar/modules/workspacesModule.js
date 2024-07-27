const hyprland = await Service.import("hyprland");

export const WorkspacesModule = () => {
    const activeWorkspaceId = hyprland.active.workspace.bind("id");
    const workspaces = [1, 2, 3, 4, 5, 6, 7];

    const BASE_CLASS = "workspaces__item";
    const FOCUSED_CLASS = "workspaces__item--focused";
    const OCCUPIED_CLASS = "workspaces__item--occupied";

    const getClassNames = (activeId, id) => {
        let className = BASE_CLASS;
        if (activeId === id) {
            className += ` ${FOCUSED_CLASS}`;
        } else {
            const windowsCount = (hyprland.getWorkspace(id)?.windows || 0);
            if (windowsCount > 0) {
                className += ` ${OCCUPIED_CLASS}`;
            }
        }
        return className;
    };

    const createWorkspaceButton = ({ id }) => {
        return Widget.Button({
            cursor: "pointer",
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            className: activeWorkspaceId.as(activeId => getClassNames(activeId, id)),
        });
    };

    const workspaceButtons = workspaces.map(id => createWorkspaceButton({ id }));

    return Widget.Box({
        className: "workspaces",
        children: workspaceButtons,
    });
};

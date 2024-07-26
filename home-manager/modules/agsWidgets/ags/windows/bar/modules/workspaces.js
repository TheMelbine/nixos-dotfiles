const hyprland = await Service.import("hyprland");

export const Workspaces = () => {
    const activeWorkspaceId = hyprland.active.workspace.bind("id");
    const workspaces = [1, 2, 3, 4, 5, 6, 7];

    const createWorkspaceButton = ({ id }) => Widget.Button({
        cursor: "pointer",
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
        className: activeWorkspaceId.as(activeId => `${activeId === id ? "workspaces__item_focused" : "workspaces__item"}`),
    });

    const workspaceButtons = workspaces.map(id => createWorkspaceButton({ id }));

    return Widget.Box({
        className: "workspaces",
        children: workspaceButtons,
    });
};

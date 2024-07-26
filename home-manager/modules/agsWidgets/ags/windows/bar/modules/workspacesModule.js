const hyprland = await Service.import("hyprland");

export const WorkspacesModule = () => {
    const activeWorkspaceId = hyprland.active.workspace.bind("id");
    const workspaces = [1, 2, 3, 4, 5, 6, 7];

    const createWorkspaceButton = ({ id }) => {
        return Widget.Button({
            cursor: "pointer",
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            className: activeWorkspaceId.as(activeId => {
                let className = "workspaces__item";
                if (activeId === id) {
                    className += " workspaces__item--focused";
                } else {
                    const windowsCount = (hyprland.getWorkspace(id)?.windows || 0);
                    if (windowsCount > 0) {
                        className += " workspaces__item--occupied";
                    }
                }
                return className;
            }),
        });
    };

    const workspaceButtons = workspaces.map(id => createWorkspaceButton({ id }));

    return Widget.Box({
        className: "workspaces",
        children: workspaceButtons,
    });
};

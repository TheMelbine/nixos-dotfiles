const hyprland = await Service.import("hyprland")

export const Workspaces = () => {
	const activeWorkspaceId = hyprland.active.bind("workspace");
	console.log(activeWorkspaceId)
};
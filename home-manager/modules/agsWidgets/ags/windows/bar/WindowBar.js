import { Workspaces } from "./modules/workspaces.js"


export const Bar = () => {
return Widget.Box({
    cursor: "default",
    class_name: 'topBar',
    children: [
        Workspaces(),
    ],
})

}
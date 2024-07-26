import { TimeModule }from "./modules/dateModule.js"
import { WorkspacesModule } from "./modules/workspacesModule.js"

const Left = () => Widget.Box({
    children: [
        WorkspacesModule(),
    ]
})

const Center = () => Widget.Box({
    children: [
        TimeModule()
    ]
})

const Right = () => Widget.Box({
    hpack: "end",
    children: [
        
    ]
})


export const Bar = () => {
return Widget.CenterBox({
    vertical: false,
    cursor: "default",
    className: 'topBar',
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right(),
})

}
import { appLauncherModule } from "./modules/appLauncherModule.js"
import { TimeModule } from "./modules/dateModule.js"
import { WorkspacesModule } from "./modules/workspacesModule.js"

const Left = () => Widget.Box({
    children: [
        appLauncherModule(),
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
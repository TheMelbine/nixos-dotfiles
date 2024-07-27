import { exec } from 'resource:///com/github/Aylur/ags/utils.js';


export const appLauncherModule = () =>{
    const launcherButton = () =>
    Widget.Button({
        cursor: 'pointer',
        className: "appLauncherModule__button",
        onClicked: () => exec(''),
        child: Widget.Icon({
            className: "appLauncherModule__icon",
            icon: 'nixos-green-logo',
         
            
        }) 
    });



    return Widget.Box({
        cursor: 'pointer',
        className: "appLauncherModule",
      children: [launcherButton()]
    })
}
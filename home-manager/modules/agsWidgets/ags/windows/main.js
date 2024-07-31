import { exec, monitorFile } from 'resource:///com/github/Aylur/ags/utils.js';
import { Bar }  from './bar/barWindow.js';
import { Applauncher } from './applauncher/applauncherWindow.js';
import {NotificationPopups} from './notification/notificationPopups.js'
const topBar = Widget.Window({
    cursor: "default",
    name: 'topBar',
    anchor: ['top', 'left', 'right'],
    child: Bar(),
    exclusivity: "exclusive",
    layer: 'bottom',
    margins: [12, 12, 0, 12],
});
const WINDOW_NAME = "applauncher"

const applauncher = Widget.Window({
    name: WINDOW_NAME,
    setup: self => self.keybind("Escape", () => {
        App.closeWindow(WINDOW_NAME)
    }),
    visible: false,
    keymode: "exclusive",
    child: Applauncher({
    }),
})



const StylesConfigDir = '/home/melbine/nix/home-manager/modules/agsWidgets/ags/styles';

App.config({
  windows: [topBar, applauncher,NotificationPopups()],
  style: `${StylesConfigDir}/build/style.css`,
  icons: `${StylesConfigDir}/source/assets`,
});

const applyCss = async () => {
  try {
      await exec(`dart-sass ${StylesConfigDir}/source/main.scss ${StylesConfigDir}/build/style.css --no-charset`);
      console.log("Scss compiled");

      App.resetCss();
      App.applyCss(`${StylesConfigDir}/build/style.css`);
      console.log(`Compiled css applied into ${StylesConfigDir}/build/style.css`);
  } catch (error) {
      if (error.message.includes('dart-sass')) {
          console.error("Error during CSS compilation:", error);
      } else if (error.message.includes('App.applyCss') || error.message.includes('App.resetCss')) {
          console.error("Error during CSS application:", error);
      } else {
          console.error("Unknown error:", error);
      }
  }
}

applyCss();

monitorFile(`${StylesConfigDir}/source`, () => {
  applyCss();
});

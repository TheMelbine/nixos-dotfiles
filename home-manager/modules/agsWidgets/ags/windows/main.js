import { exec, monitorFile } from 'resource:///com/github/Aylur/ags/utils.js';
import { Bar }  from './bar/barWindow.js';

const topBar = Widget.Window({
    cursor: "default",
    name: 'topBar',
    anchor: ['top', 'left', 'right'],
    child: Bar(),
    exclusivity: "exclusive",
    layer: 'bottom',
    margins: [12, 12, 0, 12],
})
const StylesConfigDir = '/home/melbine/nix/home-manager/modules/agsWidgets/ags/styles'

App.config({
  windows: [topBar],
  style: `${StylesConfigDir}/build/style.css`,
  icons: `${StylesConfigDir}/source/assets`,
 });
 


console
 const applyCss = () => {
  try {
      exec(`dart-sass ${StylesConfigDir}/source/main.scss ${StylesConfigDir}/build/style.css --no-charset`);
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

monitorFile(`${StylesConfigDir}/source`, () => {
  applyCss();
});


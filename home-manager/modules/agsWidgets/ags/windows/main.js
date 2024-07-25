import { exec, monitorFile } from 'resource:///com/github/Aylur/ags/utils.js';
const myLabel = Widget.Label({
    label: 'some example content',
    className: 'test',
})
 console.log(`${App.configDir}`)

const topBar = Widget.Window({
    name: 'topBar',
    anchor: ['top', 'left', 'right'],
    child: myLabel,
    exclusivity: "exclusive",
    layer: 'bottom',
    margins: [12, 12, 0, 12],
})

App.config({
  windows: [topBar],
  style: `${App.configDir}/../styles/build/style.css`,
  icons: `${App.configDir}/../styles/assets`,
 });
 



const applyCss = () => {
      exec( `sass ${App.configDir}/styles/main.scss ${App.configDir}/../styles/build/style.css`)
    console.log("Scss compiledd");

    App.resetCss();
    App.applyCss(`${App.configDir}/../styles/build/style.css`);
    console.log(`Compiled css applied into ${App.configDir}/../styles/build/style.css`);

}

monitorFile(`${App.configDir}/styles`, () => {
        applyCss()    
  });

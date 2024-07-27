const currentTime = Variable(new Intl.DateTimeFormat('ru-RU', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit'
}).format(new Date()));

setInterval(() => {
    currentTime.value = new Intl.DateTimeFormat('ru-RU', {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    }).format(new Date());
}, 1000);

export const TimeModule = () => Widget.Label({
    label: currentTime.bind(),
    className: "timeModule" 
});

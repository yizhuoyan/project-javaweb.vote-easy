function AlertMsg(status, text) {
    notif({
        msg: text,
        type: status,
        position: "center"
    });
}
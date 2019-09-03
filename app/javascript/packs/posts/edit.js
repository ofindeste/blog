//= jquery
//= require action_cable

let ActionCable = require("actioncable");

$(document).ready(() => {

    let channel = ActionCable.createConsumer("ws://localhost:3000/cable");

    let new_editor = true;

    let printed = false;
    setInterval(() => { $("#notification").empty(); printed = false; }, 4000);

    let notification = () => {
        if(!printed) {
            $("#notification").append("Новость редактируется")
        }
        printed = true;
    };

    let url = document.URL;
    let match = url.match(/posts\/(\d+)\/edit/)

    if(match) {
        let id = match[1];

        let sub = channel.subscriptions.create({ channel: "EditorChannel", id }, {
            received(data) {
                if(data.message && data.message === "ready to edit") {
                    notification();
                    if(new_editor) {
                        new_editor = false;
                    } else {
                        sub.send({ title: $("#post-title").val() });
                        sub.send({ body: $("#post-body").val() });
                    }

                    return;
                }

                const type = Object.keys(data)[0];
                if(type === "body") {
                    $("#post-body").val(data.body)
                    notification();
                } else if(type == "title") {
                    $("#post-title").val(data.title)
                    notification();
                }
            },
        });

        $("#post-title").on('input', (e) => {
            sub.send({ title: $("#post-title").val() });
            notification();
        });

        $("#post-body").on('input', (e) => {
            sub.send({ body: $("#post-body").val() })
            notification();
        });
    }
});
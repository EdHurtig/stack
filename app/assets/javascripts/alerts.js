/**
 * Created by ehurtig on 10/10/14.
 */


var Alerts = {

    notify: function (title, body, type, priority, args) {
        args = args || {};
        title = title || '';
        body = body || '';
        var notice = $('.alert_template').first().clone().removeClass('alert_template');

        notice.addClass('alert-' + type);
        notice.find('.title').text(title);
        if ('' == body) {
            notice.remove('.body');
        } else {
            notice.find('.body').text(body);
        }

        if (args.timeout) {
            setTimeout(function () {
                notice.fadeOut(2000);
            }, args.timeout);
        }
        jQuery('.alerts').append(notice);
    },
    success: function (title, body, args) {
        this.notify(title, body, 'success', 10, args);
    },
    error: function (title, body, args) {
        this.notify(title, body, 'danger', 10, args);
    },
    warning: function (title, body, args) {
        this.notify(title, body, 'warning', 10, args);
    },
    info: function (title, body, args) {
        this.notify(title, body, 'info', 10, args);
    }

}
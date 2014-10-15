/**
 * Created by ehurtig on 10/10/14.
 */



(function($){
    $(document).ready(function () {
    /* Selectors */
    var bulk_select = '.bulk_select option:selected';
    var bulk_apply  = '.bulk_apply';
    var bulk_checks  = '.bulk_check';
    var bulk_row = '.row'
    var bulk_check_all = '.bulk_check_all';

    $(bulk_check_all).click(function () {
        if ($(this).is(':checked')) {
            $(bulk_checks).prop('checked', true);
        } else {
            $(bulk_checks).prop('checked', false);
        }
    });

    $(bulk_apply).click(function () {
        var action_endpoint = $(bulk_select).data('endpoint');
        var method          = $(bulk_select).data('method');


        var ids = [];

        $(bulk_checks + ':checked').each(function (i, checkbox) {
            var $checkbox = $(checkbox);
            var id = $checkbox.attr('id').split('_')[2];
            ids.push(parseInt(id));
        });

        $.each(ids, function (i, id) {
            $.ajax({
                url: action_endpoint.replace(/#/g, 'ids[]=' + ids.join('&ids[]=')),
                method: method,
                success: function(msg) {
                    Alerts.success('Deleted ' + ids.length +  '  Events', {timeout: 3000})
                    $('#bulk_check_' + id).parents('.data-row').fadeOut()
                },
                error: function(msg) {
                    console.log(msg);
                    Alerts.error('Failed to Delete Events', 'Ajax Call to ' + action_endpoint.replaceAll('#',id) + '.  See Console for Log');
                }

            });
        })




    });

    });



})(jQuery);


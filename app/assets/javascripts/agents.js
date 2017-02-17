function filterSuburbsList() {
    var suburbs;
    suburbs = $('#agent_suburb').html();
    return $('#state_select').change(function () {
        var state, escaped_state, options;
        state = $('#state_select :selected').text();
        escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(suburbs).filter("optgroup[label=" + escaped_state + "]").html();
        if (options) {
            return $('#agent_suburb').html(options);
        } else {
            return $('#agent_suburb').empty();
        }
    });
}

$(function () {
    $('#by_name').autocomplete({
        source: $('#by_name').data('autocomplete-name')
    });
    $('#by_suburb').autocomplete({
        source: $('#by_suburb').data('autocomplete-suburb')
    });
    $('#by_state').autocomplete({
        source: $('#by_state').data('autocomplete-state``')
    });

});
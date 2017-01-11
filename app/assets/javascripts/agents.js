jQuery(function () {
    var suburbs;
    suburbs = $('#agent_suburb_id').html();
    console.log(suburbs);
    return $('#agent_state_id').change(function () {
        var state, escaped_state, options;
        state = $('#agent_state_id :selected').text();
        escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(suburbs).filter("optgroup[label=" + escaped_state + "]").html();
        console.log(options);
        if (options) {
            return $('#agent_suburb_id').html(options);
        } else {
            return $('#agent_suburb_id').empty();
        }
    });
});
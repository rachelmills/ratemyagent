$(document).on('turbolinks:load', function() {
    $('.star-rating').raty({
        path: '/images/',
        readOnly: true,
        score: function () {
            return $(this).attr('data-score');
        }
    });

    $('#star-rating').raty({
        path: '/images/',
        scoreName: 'rating[star_rating]'
    });
});
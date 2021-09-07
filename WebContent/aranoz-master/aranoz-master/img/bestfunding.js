function best_seller(){
    $('.best_seller').addClass('active');
    $('.best_like').removeClass('active');
    $('.best_review').removeClass('active');
    $('.sell').css("display", "block");
    $('.like').css("display", "none");
    $('.review').css("display", "none");
}
function best_like(){
    $('.best_like').addClass('active');
    $('.best_seller').removeClass('active');
    $('.best_review').removeClass('active');
    $('.sell').css("display", "none");
    $('.like').css("display", "block");
    $('.review').css("display", "none");
}
function best_review(){
    $('.best_review').addClass('active');
    $('.best_seller').removeClass('active');
    $('.best_like').removeClass('active');
    $('.sell').css("display", "none");
    $('.like').css("display", "none");
    $('.review').css("display", "block");
}
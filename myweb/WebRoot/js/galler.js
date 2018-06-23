$(function() {
    var i = 4;
    var imgs = $("#pic-list img");
    var len = imgs.length;
    var pageCout = Math.ceil(len/i);
    var page = 1;
    var moveLen = $("#pic-scroll").height();
    var rollBar = $("#pic-list");
    $(".pre-picture").click(function() {
        if(page == 1) {
            rollBar.animate({top : '-='+moveLen*(pageCout-1)}, "slow");
            page = pageCout;
        } else {
            rollBar.animate({top : '+='+moveLen}, "slow");
            page--;
        }
    });
    $(".next-picture").click(function() {
       if(page == pageCout) {
           rollBar.animate({top : '0px'}, "slow");
           page = 1;
       } else {
           rollBar.animate({top : '-='+moveLen}, "normal");
           page++;
       }
    });
    imgs.click(function() {
      var src = $(this).attr('src');
      $("#picture").attr('src', src);
      $(this).addClass('current').siblings().removeClass('current');
    });
    // ת��������Ԥ��
    $('#switch').click(function() {
      $('#quicklook').css('display', 'block');
      $('#right').css('display', 'none');
      $('#left').css('display', 'none');
    });
    // �˳�����Ԥ��
    $('#goback').click(function() {
      $('#right').css('display', 'block');
      $('#left').css('display', 'block');
      $('#quicklook').css('display', 'none');
      return false;
    });
    // ��ʾȫͼ����
    $('#right img').click(function() {
      var src = $(this).attr('src');
      $('#display img').attr('src', src);
      $('#display').css('display', 'block');
    });
    $('#picture').click(function() {
      var src = $(this).attr('src');
      $('#display img').attr('src', src);
      $('#display').css('display', 'block');
    });
    // �ر�ȫͼ��ʾ����
    $('#display').click(function() {
      $(this).css('display', 'none');
    });
    // ����ɫ���ʾ��ǰͼƬ
    $('#pic-list img').click(function() {
      $(this).addClass('current').siblings().removeClass('current');
      var index = $('#pic-list img').index(this)+1;
      $('#hint').text(index+'/'+len);
    });
    $('#pic-list img:first-child').addClass('current');
});
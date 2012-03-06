
$(function(){
  
  product_data = [];
  
  $.ajax({
    url: 'json/product_data.json',
    type: 'GET',
    dataType: "json",
    success: function(data){
      /*
       * WA: Javascript automatically serializes json data.
       *    Following loop is not required. A simple
       *    product_data = data will work
       */
      $.each(data, function(index, product) {
        product_data.push(product);
      });
      show_products(product_data);
    }
  });
  
  /*
   * WA: Use module pattern to organize code under
   *    a javascript object. It will make code maintainable
   *    and easy to use at other places in the application.
   *    http://addyosmani.com/resources/essentialjsdesignpatterns/book/#modulepatternjavascript
   */
  function show_products(data) {
  
    /*
     * WA: Following is a slow selector. Use better and fast selectors.
     *    See http://api.jquery.com/has-selector/ and http://jqfundamentals.com/#chapter-9
     *    and if really interested, http://paulirish.com/2009/perf/
     */
    $('tr:has(td)').remove();
    
    $.each(data, function(index, product) {
      /*
       * WA: Very bad variable names. Use something like product_row, brand, color, name etc
       */
      var tr = $('<tr/>');
      var td1 = $('<td/>'), td2 = $('<td/>'), td3 = $('<td/>'), td4 = $('<td/>'), td5 = $('<td/>');
      
      $(td1).html("<img height='50' width='50' src='images/" + product.url + "'/>");
      $(td2).html(product.name);
      $(td3).html(product.color);
      $(td4).html(product.brand);
      
      if(product.sold_out == 1) {
        $(td5).html("Sold Out");
      } else if(product.sold_out == 0){
        $(td5).html("Available");
      }
      
      /*
       * WA: Try to append elements to DOM outside of a loop.
       *    See links mentioned above for fast selectors.
       */
      $(tr).append(td1,td2,td3,td4,td5);
      $('table').append(tr);
      
      $("table tr:nth-child(even)").addClass("striped");
    });
  }
  
  /*
   * WA: Do not use .bind, .live etcetera. Start using .on
   *   See http://www.elijahmanor.com/2012/02/differences-between-jquery-bind-vs-live.html#tldr
   */
  $('input').bind('click', filters);
  $('#toggle_tabs a').bind('click', toggle_active);
//  $('#toggle_tabs a').bind('click', filters);
  
  function toggle_active() {
    if($(this).hasClass('active')) {
      return
    }
    $('#toggle_tabs a').toggleClass('active');
    filters();
  }
  
  function filters() {
    
    var data = product_data;
    
    data = filter.brand(data);
    data = filter.color(data);
    data = filter.availability(data);
    
    show_products(data);
  }
  
  var filter = {
    brand: function(data) {
      var brands_selected = $.map( $('#brands input:checked'), function(inp) {
        return $(inp).val();
      });
      
      if(brands_selected.length > 0) {
        data = $.grep(data, function(product) {
          return $.inArray(product.brand, brands_selected) !== -1;
        });
      }
      
      return data;
    },
    
    color: function(data) {
      var colors_selected = $.map( $('#colors input:checked'), function(inp) {
        return $(inp).val();
      });
      
      if(colors_selected.length > 0) {
        data = $.grep(data, function(product) {
          return $.inArray(product.color, colors_selected) !== -1;
        });
      }
      
      return data;
    },
    
    availability: function(data) {
      var active_tab = $('.active').html();
    
      if(active_tab == 'Available Products') {
        data = $.grep(data, function(product) {
          return product.sold_out == '0';
        });
      }
      
      return data;
    }
  }
  
});

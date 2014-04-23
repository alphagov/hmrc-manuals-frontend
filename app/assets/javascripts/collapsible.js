(function() {
  "use strict";
  window.GOVUK = window.GOVUK || {};

  function Collapsible(section){
    this.$section = section;
    this.$clickTarget = this.$section.find('.subsection-title');
    this.$clickTarget.on('click', $.proxy(this.toggle, this))
  }

  Collapsible.prototype.toggle = function toggle(){
    this.$section.toggleClass('closed')
  }

  Collapsible.prototype.close = function close(){
    this.$section.addClass('closed');
  }

  Collapsible.prototype.open = function open(){
    this.$section.removeClass('closed');
  }

  Collapsible.prototype.isClosed = function(){
    return this.$section.hasClass('closed');
  }

  GOVUK.Collapsible = Collapsible;
}());

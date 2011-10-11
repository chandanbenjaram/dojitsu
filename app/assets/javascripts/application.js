// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require rails.validations
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

(function($){
    $(document).ready(function() {
        var menustate = $(this).readMenuState();
        if(menustate)
        {
            $.each($('.selectable'), function(idx, val){
                if($(val).getPath() === menustate){
                    $(val).addClass('selected');
                    $(val).parents('div.selectable').addClass('selected');
                }
            });
        }

        $('.selectable').live('click',
            function(){
                $(this).addClass('selected');
                $(this).saveMenuState($(this).getPath());
            }
            );
    });


    // save menustate
    $.fn.saveMenuState = function(arg0) {
        window.localStorage.setItem("menustate", arg0);
    }

    // read menustate
    $.fn.readMenuState = function(){
        return window.localStorage.getItem("menustate");
    }

    /**
    * getPath: function helps us to calculate unique path of element under DOM.
    * Work is copied as-it-is from 3rd party sources.
    */
    $.fn.getPath = function () {
        if (this.length != 1) throw 'Requires one element.';

        var path, node = this;
        while (node.length) {
            var realNode = node[0], name = realNode.localName;
            if (!name) break;
            name = name.toLowerCase();

            var parent = node.parent();

            var siblings = parent.children(name);
            if (siblings.length > 1) {
                name += ':eq(' + siblings.index(realNode) + ')';
            }

            path = name + (path ? '>' + path : '');
            node = parent;
        }

        return path;
    };

})(jQuery);
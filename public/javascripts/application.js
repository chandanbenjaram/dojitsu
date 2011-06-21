// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
;
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
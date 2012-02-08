    <script> 
	
     $('.task_update_popup').colorbox();
	 
    window.fbAsyncInit();
     
    FB.getLoginStatus(function(response) { 
     
            if (response.session)
            { 
                       globaluserid=response.session["uid"]; 
					   name=globaluserid;
					    $("#username").append(name);
                      FB.api( 
                         
                                    { 
                                     
                                    method: 'fql.query',
                                    
                                    query: 'SELECT uid1 FROM friend WHERE uid2='+globaluserid
                                    
                                    },
                        
                                    function(response)
                                    {
                                            var a=response.length;
											$("#total").append(a);
                                             for(i=0;i<a;i++)
                                             {
                                               
                                                        FB.api({
                                                       
                                                            method: 'fql.query',
                                                           
                                                            query: 'SELECT name,pic_square FROM user WHERE uid=' + response[i].uid1
                                                       
                                                        }, function(response){
                                                               
                                                                htmlcontent = '<img src=' + response[0].pic_square + ' title=' + response[0].name + ' />';
                                                                htmlcontent1 ='<b>'+ response[0].name;+'</b>'
                                                                htmlcontent3='<table>';
                                                                htmlcontent4='<td>';
                                                                htmlcontent5='</td>';
                                                                htmlcontent6='</table>'
                                                                htmlcontent2 = '<br/>';
																htmlcontent2 = '<hr width="800px">';
                                                               
                                                                $("#friendslist").append(htmlcontent3);
                                                                $("#friendslist").append(htmlcontent4);
                                                                $("#friendslist").append(htmlcontent);
                                                               
                                                                $("#friendslist").append(htmlcontent1);
                                                                $("#friendslist").append(htmlcontent5);
                                                                $("#friendslist").append(htmlcontent6);
                                                               
                                                           
                                                                $("#friendslist").append(htmlcontent2);
                                                               
                                                               
                                                       
                                                        });
                                                       
                                                   
                                             
                                             } 
                                     
                                    } 
                         
                        ); 
             
            }
            else
            { 
                   top.location.href="../kfb_login.php"; 
     
            } 
     
    }); 
     
    </script>
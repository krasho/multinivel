/**
 * Created by Krasho on 02/08/14.
 */
$(document).ready(function(){

    //Acciones cuando presione uno de los elementos del menú
    $("#menuLogin").click(function(e){
        e.preventDefault();
       $("#loggeo").toggle("slow");
    });


});

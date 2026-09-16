function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;

}

char_colors = {
    "Congrats": c_green,
    "Gabriel": c_aqua,
    "Uriel": c_fuchsia,
    "Harry": c_yellow
}

welcome_dialog = [{
    name: "Gabriel",
    msg: "Welcome to the heaven we're currently under attack so we will have to postpone your judgment."    
},
{
    name: "Harry",
    msg: "My judgement? What? I haven't died yet.... Wait Heaven is under attack, by what?!"    
},
{
    name: "Gabriel",
    msg: "Devils, specificly Lucifier the fallen angel and his guard."    
},
{
    name: "Harry",
    msg: "What does this mean for me? Last I remember there was a glowing light and then I woke up here."    
},
{
    name: "Gabriel",
    msg: "*gasps*"    
},
{
    name: "Gabriel",
    msg: "Seems you haven been called upon by our Lord... This must mean God has been captured."    
},
{
    name: "Harry",
    msg: "WHAT?!"    
},
{
    name: "Harry",
    msg: "Why would I get chosen?"    
},
{
    name: "Gabriel",
    msg: "All will be revealed, but for now there is no time for that. I will give you power as you journey through this Hellish Heaven take this sword and push through the demon army and kill Lucifer."    
}
]

end_dialog = [{
    name: "Uriel",
    msg: "You're finally here! Come quick Lucifer is just up ahead. He took God then ran."    
},
{
    name: "Harry",
    msg: "Finally I made it and I can finally get some answers. I've been through hell in heaven can I finally go home now!"    
},
{
    name: "Uriel",
    msg: "The only one with the power to do that is our Lord. You must save him in order to leave or get any sort of answers."    
},
{
    name: "Harry",
    msg: "So just kill the Devil and I get to go home?..."    
},
{
    name: "Uriel",
    msg: "Yup, that easy."    
},
{
    name: "Harry",
    msg: "Doesnt sound too easy... If its so easy why haven't you done it?"    
},
{
    name: "Uriel",
    msg: "..."    
},
{
    name: "Uriel",
    msg: "Just go save God already..."    
},
{
    name: "Harry",
    msg: "I know its my only option but you could sound a little more grateful."    
},
{
    name: "Uriel",
    msg: "*rolls eyes*"    
}
]

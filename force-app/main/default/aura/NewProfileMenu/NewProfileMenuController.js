({
    handleClick : function(component, event, helper) {
        var source = event.getSource();
        var label = source.get("v.label");
        console.log('label'+label+'END1');
        var urlEvent = $A.get("e.force:navigateToURL");
        console.log('label'+label+'END2');
        if(label=="My Account Info"){
            urlEvent.setParams({"url":"/view-or-update-account"});
            urlEvent.fire();
        }else if(label=="Home"){
            console.log('label'+label+'END3');
            urlEvent.setParams({"url":"/ "});
            urlEvent.fire();
        }else if(label=="Log Out"){
            console.log('label'+label+'END3');
            urlEvent.setParams({"url":"https://yigcwmt-developer-edition.na150.force.com/tracking/secur/logout.jsp"});
            urlEvent.fire();
        }
    }
})
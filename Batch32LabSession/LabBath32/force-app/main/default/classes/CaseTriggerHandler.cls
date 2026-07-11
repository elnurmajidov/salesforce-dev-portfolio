public class CaseTriggerHandler {

// 1. Whenever a case is created with origin as email then set status as new and Priority as Medium.
    public static void caseCreated(list<case> TriggerNew) {

// 1. Whenever a case is created with origin as email then set status as new and Priority as Medium.
for(Case c : TriggerNew){
    if(c.Origin == 'Email'){
        c.Status = 'New';
        c.Priority = 'Medium';
    }
}

// 2. When a case is created, check the description field of the newly created case - if the description
// field contains the word ‘password’, then create a child case with the following field values
// - subject = ‘Parent Case may contain secret info, do something NOW’
// - parentId = _______ (newly create case id)
// - priority = ‘High’
// - Description = ‘Secret info not allowed in case’

    public static void caseCreatedCheck(List<Case> TriggerNew){
        List <Case> childCaseList = new List <Case>();
        for(Case c : TriggerNew){
            if(String.isNotBlank(c.Description) && c.Description.contains('password')){
                case childCase = new Case();
                childCase.Subject = 'Parent Case may contain secret info, do something NOW';
                childCase.ParentId = c.Id;
                childCase.Priority = 'High';
                childCase.Description = 'Secret info not allowed in case';
                childCaseList.add(childCase);
            }
        }
        insert childCaseList;
    }
}
}
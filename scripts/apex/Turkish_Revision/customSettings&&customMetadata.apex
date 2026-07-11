DiscountSettings__c DS = DiscountSettings__c.getOrgDefaults();
System.debug(DS);

//DiscountSettings__c:{Id=a08fj00000ImOTvAAN, IsDeleted=false, Name=a08fj00000ImOTv, SetupOwnerId=00Dfj00000FEjW5EAL, CreatedDate=2026-03-14 02:43:59, CreatedById=005fj000009ndW5AAI, LastModifiedDate=2026-03-14 02:43:59, LastModifiedById=005fj000009ndW5AAI, SystemModstamp=2026-03-14 02:43:59, DiscountRate__c=5.0}

Decimal defaultRate = DS.DiscountRate__c;
System.debug('default rate ' + defaultRate);

Id marketingId = [ SELECT Id, FROM Profile where name = 'Marketing User'].Id;
DiscountSettings__ marketingDS = DiscountSettings__c.getInstance(marketingUserId);
System.debug(marketingDS);

//Id=a08fj00000ImOTvAAN, IsDeleted=false, Name=a08fj00000ImOTv, SetupOwnerId=00Dfj00000FEjW5EAL, CreatedDate=2026-03-14 02:43:59, CreatedById=005fj000009ndW5AAI, LastModifiedDate=2026-03-14 02:43:59, LastModifiedById=005fj000009ndW5AAI, SystemModstamp=2026-03-14 02:43:59, DiscountRate__c=5.0}

Decimal marketingRate = marketingDS.DiscountRate__c;
System.debug(marketingRate);

Id userId = UserInfo.getUserID();
Decimal userRate = DiscountSettings__c.getInstance(userId).DiscountRate__c;
System.debug(userRate);

// Custom settings hiyerarsisi modunda kullanilir.(list mod icin custom metadate tercih edilir).
//Relationship fieldlari yoktur.
//Recordlari deploy edemiyoruz
// Test esnasinda custom settings recordunu olusturmaniz gerekir.

//===========================================================================//


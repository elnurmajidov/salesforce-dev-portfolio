StaticAndNonStatic.sampleStaticString = 'Bu bir STATIC desgiskendir..';
System.debug(StaticAndNonStatic.sampleStaticString );

StaticAndNonStatic sc = new StaticAndNonStatic();
sc.sampleString = 'Bu bir NON-STATIC degiskendir...';
System.debug(sc.sampleString);


// f

StaticAndNonStatic st = new StaticAndNonStatic();
st.sampleString = 'Demo';
st.sampleMetot();
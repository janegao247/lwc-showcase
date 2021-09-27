@IsTest
public with sharing class Test_Utils {
    private static Integer fakeIdCount = 0;
    private static final String ID_PATTERN = '000000000000';
    public static Id generateId(SObjectType sobjectType) {
        String keyPrefix = sobjectType.getDescribe().getKeyPrefix();
        fakeIdCount++;
        String fakeIdPrefix = ID_PATTERN.substring(
          0,
          12 - fakeIdCount.format().length()
        );
    return Id.valueOf(keyPrefix + fakeIdPrefix + fakeIdCount);
    }
}

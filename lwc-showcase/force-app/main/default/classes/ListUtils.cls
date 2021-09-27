public with sharing class ListUtils {
    public static SObject firstOrDefault(
        List<SObject> objects,
        Schema.SObjectField property,
        string value
      ) {
        for (SObject currentObject : objects) {
          if (currentObject.get(property) == value) {
            return currentObject;
          }
        }
        return null;
    }
}

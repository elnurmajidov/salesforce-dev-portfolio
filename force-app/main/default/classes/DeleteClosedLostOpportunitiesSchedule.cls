public class deleteClosedLostOpportunitiesSchedule implements Schedulable {

    public void execute(SchedulableContext SC) {
        DeleteClosedLostOpportunitiesBatch dlb = new DeleteClosedLostOpportunitiesBatch();
        Database.executeBatch(dlb);
    }

}
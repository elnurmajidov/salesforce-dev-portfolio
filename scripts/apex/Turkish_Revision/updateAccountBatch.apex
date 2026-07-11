UpdateAccountBatch uab = new UpdateAccountBatch();
// Id jobId = Database.executeBatch(uab); // 200
Id jobId = Database.executeBatch(uab,2); // 1 ile 2000
System.debug('JobId ' + jobId);
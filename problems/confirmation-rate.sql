-- Difficulty: medium
WITH confs AS (
  SELECT
    s.user_id,
    count(c.action) AS confirmations
  FROM
    Signups s
    LEFT JOIN Confirmations c ON c.user_id = s.user_id
      AND c.action = 'confirmed'
  GROUP BY
    s.user_id
),
timeouts AS (
  SELECT
    s.user_id,
    count(c.action) AS timeouts
  FROM
    Signups s
    LEFT JOIN Confirmations c ON c.user_id = s.user_id
      AND c.action = 'timeout'
  GROUP BY
    s.user_id
)
SELECT
  s.user_id,
  round(IFNULL (confirmations / (confirmations + timeouts), 0), 2) AS confirmation_rate
FROM
  Signups s
  LEFT JOIN confs c ON c.user_id = s.user_id
  LEFT JOIN timeouts t ON t.user_id = s.user_id
GROUP BY
  s.user_id,
  confirmations,
  timeouts;

-- Test case 13/14
-- Time Limit Exceeded
-- Signups
-- | user_id | time_stamp          |
-- | ------- | ------------------- |
-- | 40      | 2021-01-07 03:17:44 |
-- | 72      | 2020-01-03 04:24:26 |
-- | 90      | 2020-06-12 14:05:39 |
-- | 32      | 2021-09-24 19:00:10 |
-- | 66      | 2020-12-16 14:20:48 |
-- | 9       | 2020-07-27 14:14:17 |
-- | 47      | 2021-05-25 14:57:04 |
-- | 50      | 2021-04-20 04:09:43 |
-- | 73      | 2020-10-17 22:32:58 |
-- | 84      | 2020-07-22 07:42:21 |
-- | 171     | 2020-01-07 20:04:09 |
-- | 200     | 2020-08-03 01:31:10 |
-- | 41      | 2020-10-06 19:05:51 |
-- | 150     | 2020-03-05 20:34:13 |
-- | 145     | 2020-01-30 20:32:26 |
-- | 174     | 2021-11-14 22:38:17 |
-- | 154     | 2021-08-26 16:17:06 |
-- | 188     | 2020-05-06 16:35:36 |
-- | 149     | 2021-05-18 14:45:08 |
-- | 143     | 2021-10-02 06:46:20 |
-- | 183     | 2021-12-03 01:25:13 |
-- | 21      | 2021-01-03 09:14:10 |
-- | 178     | 2020-04-09 13:47:38 |
-- | 25      | 2020-04-16 15:47:27 |
-- | 93      | 2021-03-18 03:10:46 |
-- | 165     | 2021-05-10 19:31:34 |
-- | 49      | 2020-06-01 11:50:04 |
-- | 67      | 2021-03-23 20:46:27 |
-- | 182     | 2021-10-24 18:08:54 |
-- | 52      | 2021-08-28 12:13:25 |
-- | 159     | 2021-06-18 06:55:01 |
-- | 71      | 2021-11-22 22:58:38 |
-- | 108     | 2021-02-17 17:23:14 |
-- | 57      | 2021-05-29 05:13:39 |
-- | 186     | 2020-10-18 06:20:03 |
-- | 34      | 2020-09-18 18:48:59 |
-- | 2       | 2020-02-04 22:58:05 |
-- | 140     | 2020-07-28 20:24:03 |
-- | 96      | 2020-02-23 02:12:36 |
-- | 11      | 2020-07-09 16:55:59 |
-- | 28      | 2020-02-28 06:54:31 |
-- | 30      | 2020-07-12 07:28:30 |
-- | 61      | 2020-09-26 00:17:10 |
-- | 23      | 2020-09-09 07:18:09 |
-- | 15      | 2021-10-20 17:09:44 |
-- | 176     | 2021-05-28 08:07:41 |
-- | 175     | 2020-03-26 10:39:18 |
-- | 197     | 2021-06-24 20:13:43 |
-- | 122     | 2021-07-05 18:38:38 |
-- | 184     | 2021-02-13 04:59:49 |
-- | 118     | 2020-05-20 10:24:44 |
-- | 18      | 2020-03-12 05:23:09 |
-- | 147     | 2020-12-04 22:39:20 |
-- | 179     | 2021-05-17 08:36:28 |
-- | 121     | 2021-07-20 19:47:43 |
-- | 138     | 2020-09-08 17:50:37 |
-- | 91      | 2020-01-23 02:05:42 |
-- | 22      | 2020-01-21 00:07:53 |
-- | 7       | 2021-01-31 22:59:02 |
-- | 3       | 2021-12-03 11:12:41 |
-- | 100     | 2020-09-07 02:14:41 |
-- | 38      | 2021-09-22 08:19:03 |
-- | 55      | 2020-05-14 04:41:45 |
-- | 115     | 2020-04-17 14:51:53 |
-- | 83      | 2021-11-16 20:00:55 |
-- | 191     | 2020-06-05 10:22:44 |
-- | 173     | 2021-11-26 03:58:37 |
-- | 42      | 2021-12-20 04:40:02 |
-- | 44      | 2021-12-19 17:13:50 |
-- | 10      | 2021-07-15 04:49:00 |
-- | 141     | 2021-01-19 03:36:00 |
-- | 107     | 2021-09-17 23:21:58 |
-- | 116     | 2020-02-13 15:59:31 |
-- | 29      | 2020-07-16 14:39:10 |
-- | 19      | 2021-04-12 23:48:12 |
-- | 110     | 2021-03-16 19:06:55 |
-- | 139     | 2020-07-17 02:57:54 |
-- | 130     | 2020-03-13 20:10:38 |
-- | 8       | 2020-04-03 06:17:38 |
-- | 59      | 2021-01-04 04:27:54 |
-- | 51      | 2021-02-05 21:39:12 |
-- | 31      | 2021-03-06 06:27:44 |
-- | 75      | 2020-04-23 18:20:12 |
-- | 78      | 2020-12-28 03:33:26 |
-- | 131     | 2021-01-19 18:30:50 |
-- | 43      | 2020-03-08 10:38:08 |
-- | 81      | 2020-06-21 10:09:04 |
-- | 120     | 2020-03-18 21:19:11 |
-- | 129     | 2021-01-06 12:36:50 |
-- | 103     | 2020-02-22 20:04:08 |
-- | 77      | 2021-12-30 15:58:54 |
-- | 109     | 2021-06-11 23:06:52 |
-- | 195     | 2020-07-30 12:24:44 |
-- | 187     | 2021-11-10 18:18:58 |
-- | 125     | 2021-11-20 13:03:30 |
-- | 12      | 2020-10-22 05:50:09 |
-- | 127     | 2020-01-20 10:35:46 |
-- | 1       | 2020-02-29 20:52:57 |
-- | 6       | 2021-03-24 23:56:20 |
-- | 45      | 2020-12-15 04:02:18 |
-- Confirmations
-- | user_id | time_stamp          | action    |
-- | ------- | ------------------- | --------- |
-- | 110     | 2020-12-01 15:55:01 | confirmed |
-- | 140     | 2021-11-12 16:15:11 | confirmed |
-- | 71      | 2020-11-16 02:01:16 | timeout   |
-- | 84      | 2020-04-11 05:59:41 | confirmed |
-- | 120     | 2020-10-04 19:31:13 | confirmed |
-- | 191     | 2021-05-27 07:26:57 | timeout   |
-- | 6       | 2021-09-22 05:59:04 | confirmed |
-- | 130     | 2020-11-28 09:24:56 | timeout   |
-- | 182     | 2020-11-24 18:31:54 | timeout   |
-- | 191     | 2021-08-11 10:49:18 | confirmed |
-- | 100     | 2020-03-19 16:16:23 | timeout   |
-- | 23      | 2020-07-17 02:23:22 | timeout   |
-- | 31      | 2020-07-21 17:39:30 | timeout   |
-- | 28      | 2021-10-29 04:34:10 | timeout   |
-- | 138     | 2020-04-03 22:43:38 | timeout   |
-- | 51      | 2021-03-25 13:00:19 | timeout   |
-- | 43      | 2020-01-25 08:47:47 | timeout   |
-- | 29      | 2020-04-17 15:44:50 | confirmed |
-- | 188     | 2021-04-18 21:04:57 | timeout   |
-- | 67      | 2021-12-09 07:24:17 | timeout   |
-- | 2       | 2020-07-17 10:01:01 | timeout   |
-- | 10      | 2021-10-28 15:18:36 | confirmed |
-- | 130     | 2020-11-22 17:21:13 | timeout   |
-- | 108     | 2021-01-26 01:49:55 | timeout   |
-- | 72      | 2020-10-30 18:43:41 | confirmed |
-- | 149     | 2021-11-30 20:39:20 | timeout   |
-- | 67      | 2020-11-28 09:30:32 | timeout   |
-- | 91      | 2020-09-02 23:03:55 | timeout   |
-- | 38      | 2021-01-05 09:40:26 | timeout   |
-- | 121     | 2020-12-09 22:22:41 | confirmed |
-- | 96      | 2021-08-23 14:27:13 | timeout   |
-- | 10      | 2020-11-20 16:56:49 | timeout   |
-- | 138     | 2021-02-08 14:59:10 | timeout   |
-- | 174     | 2020-01-28 07:26:48 | confirmed |
-- | 22      | 2021-03-10 12:35:45 | timeout   |
-- | 187     | 2021-12-12 07:59:20 | timeout   |
-- | 25      | 2020-08-07 21:38:04 | confirmed |
-- | 2       | 2020-04-28 09:02:05 | confirmed |
-- | 118     | 2020-09-15 14:52:18 | timeout   |
-- | 116     | 2021-12-23 04:32:05 | confirmed |
-- | 18      | 2020-08-21 01:38:49 | confirmed |
-- | 10      | 2021-11-30 12:12:51 | timeout   |
-- | 147     | 2021-12-02 01:09:14 | timeout   |
-- | 25      | 2020-02-16 16:43:14 | timeout   |
-- | 29      | 2021-10-29 08:51:41 | timeout   |
-- | 171     | 2020-07-24 09:33:22 | timeout   |
-- | 28      | 2021-09-16 09:22:04 | timeout   |
-- | 186     | 2020-06-17 12:44:00 | timeout   |
-- | 50      | 2020-02-02 21:32:23 | timeout   |
-- | 91      | 2020-06-25 13:30:18 | timeout   |
-- | 147     | 2021-04-23 12:43:08 | timeout   |
-- | 59      | 2021-06-02 00:12:40 | timeout   |
-- | 195     | 2021-09-22 09:09:04 | confirmed |
-- | 173     | 2021-11-01 07:09:04 | confirmed |
-- | 22      | 2021-01-04 02:28:22 | confirmed |
-- | 103     | 2021-05-20 21:10:13 | confirmed |
-- | 116     | 2021-01-05 18:57:14 | timeout   |
-- | 81      | 2020-09-22 04:18:43 | confirmed |
-- | 176     | 2021-06-18 19:06:09 | timeout   |
-- | 139     | 2021-06-21 02:44:27 | confirmed |
-- | 182     | 2021-11-16 08:34:18 | confirmed |
-- | 115     | 2021-12-27 10:10:49 | confirmed |
-- | 44      | 2020-07-16 23:42:18 | confirmed |
-- | 84      | 2020-04-29 02:43:37 | confirmed |
-- | 182     | 2021-02-08 04:47:39 | timeout   |
-- | 3       | 2021-03-12 16:06:29 | timeout   |
-- | 72      | 2020-07-17 19:24:18 | timeout   |
-- | 184     | 2020-02-03 16:10:56 | timeout   |
-- | 191     | 2021-04-13 21:08:35 | timeout   |
-- | 120     | 2021-01-29 15:12:02 | timeout   |
-- | 175     | 2020-06-01 00:24:43 | timeout   |
-- | 108     | 2020-03-15 01:48:04 | timeout   |
-- | 49      | 2020-07-08 15:21:21 | timeout   |
-- | 109     | 2020-09-30 12:48:51 | confirmed |
-- | 21      | 2020-01-07 13:29:10 | timeout   |
-- | 40      | 2021-03-08 11:18:13 | timeout   |
-- | 55      | 2021-04-08 02:07:17 | timeout   |
-- | 179     | 2021-11-21 20:49:45 | timeout   |
-- | 31      | 2020-01-05 11:13:43 | confirmed |
-- | 118     | 2021-04-15 15:24:01 | timeout   |
-- | 19      | 2021-12-14 21:29:19 | timeout   |
-- | 91      | 2020-06-10 10:06:46 | confirmed |
-- | 57      | 2020-03-29 08:03:26 | timeout   |
-- | 28      | 2021-12-16 05:31:14 | timeout   |
-- | 175     | 2021-10-19 08:51:26 | confirmed |
-- | 78      | 2021-12-17 23:00:08 | timeout   |
-- | 42      | 2021-07-28 04:13:06 | timeout   |
-- | 21      | 2021-03-08 11:31:29 | timeout   |
-- | 93      | 2020-07-01 15:36:48 | timeout   |
-- | 30      | 2021-07-23 17:32:51 | timeout   |
-- | 38      | 2020-05-09 02:43:57 | timeout   |
-- | 154     | 2021-01-25 19:43:54 | timeout   |
-- | 23      | 2021-11-15 20:44:26 | confirmed |
-- | 115     | 2021-01-03 01:18:12 | confirmed |
-- | 149     | 2021-03-29 11:05:25 | confirmed |
-- | 66      | 2021-08-28 22:09:36 | confirmed |
-- | 43      | 2020-03-17 15:44:23 | timeout   |
-- | 186     | 2020-06-14 16:01:52 | timeout   |
-- | 176     | 2021-11-08 13:13:42 | timeout   |
-- | 22      | 2020-09-08 01:41:46 | timeout   |
-- | 125     | 2020-01-05 21:09:23 | confirmed |
-- | 108     | 2021-12-24 19:42:46 | confirmed |
-- | 47      | 2020-02-05 16:30:13 | timeout   |
-- | 12      | 2020-10-22 17:33:47 | confirmed |
-- | 2       | 2020-06-05 10:47:36 | confirmed |
-- | 44      | 2020-11-03 03:54:36 | timeout   |
-- | 84      | 2020-05-05 01:39:07 | timeout   |
-- | 32      | 2021-07-21 21:24:31 | timeout   |
-- | 40      | 2020-09-12 05:20:19 | timeout   |
-- | 47      | 2021-07-10 06:36:44 | timeout   |
-- | 3       | 2020-05-23 02:27:03 | timeout   |
-- | 138     | 2021-10-16 06:35:06 | confirmed |
-- | 73      | 2020-06-15 16:34:00 | timeout   |
-- | 73      | 2021-10-21 19:41:27 | timeout   |
-- | 78      | 2021-07-04 23:48:56 | confirmed |
-- | 127     | 2020-08-12 11:28:15 | confirmed |
-- | 57      | 2021-02-18 02:13:15 | timeout   |
-- | 110     | 2021-01-23 16:14:42 | confirmed |
-- | 7       | 2021-01-17 15:36:56 | confirmed |
-- | 149     | 2021-09-05 19:20:54 | confirmed |
-- | 103     | 2021-02-15 16:06:15 | timeout   |
-- | 38      | 2021-02-11 23:20:47 | timeout   |
-- | 121     | 2021-02-28 06:50:55 | timeout   |
-- | 29      | 2021-12-28 22:13:23 | confirmed |
-- | 103     | 2020-10-06 21:12:32 | timeout   |
-- | 8       | 2021-01-08 03:28:18 | timeout   |
-- | 96      | 2021-11-13 15:21:23 | timeout   |
-- | 15      | 2020-12-07 20:07:54 | confirmed |
-- | 3       | 2020-11-29 06:52:06 | confirmed |
-- | 15      | 2021-09-19 22:14:21 | timeout   |
-- | 1       | 2021-12-27 10:05:36 | timeout   |
-- | 130     | 2021-11-01 17:55:22 | timeout   |
-- | 72      | 2021-07-26 22:09:27 | timeout   |
-- | 67      | 2021-10-02 15:33:25 | timeout   |
-- | 140     | 2020-07-05 15:17:36 | timeout   |
-- | 200     | 2020-12-05 14:27:15 | timeout   |
-- | 179     | 2021-05-11 00:31:07 | timeout   |
-- | 30      | 2021-04-03 06:17:58 | confirmed |
-- | 43      | 2021-09-14 15:34:19 | timeout   |
-- | 159     | 2020-11-22 12:14:14 | confirmed |
-- | 83      | 2021-05-11 15:29:44 | timeout   |
-- | 73      | 2021-08-13 12:30:25 | timeout   |
-- | 66      | 2020-04-28 23:18:23 | confirmed |
-- | 178     | 2020-12-30 22:49:17 | timeout   |
-- | 6       | 2021-11-12 13:45:19 | confirmed |
-- | 154     | 2020-09-10 01:34:45 | timeout   |
-- | 55      | 2020-02-29 03:21:03 | confirmed |
-- | 66      | 2021-11-11 14:08:33 | confirmed |
-- | 129     | 2021-05-25 10:27:58 | confirmed |
-- | 116     | 2020-03-27 16:03:29 | confirmed |
-- | 6       | 2020-08-13 15:13:30 | timeout   |
-- | 175     | 2021-09-30 10:09:13 | confirmed |
-- | 147     | 2020-01-09 06:26:53 | timeout   |
-- | 173     | 2020-03-01 02:50:22 | timeout   |
-- | 127     | 2021-12-05 20:10:20 | timeout   |
-- Test case 1
-- Create table If Not Exists Signups (user_id int, time_stamp datetime);
-- Create table If Not Exists Confirmations (user_id int, time_stamp datetime, action ENUM('confirmed','timeout'));
-- Truncate table Signups;
-- insert into Signups (user_id, time_stamp) values ('3', '2020-03-21 10:16:13');
-- insert into Signups (user_id, time_stamp) values ('7', '2020-01-04 13:57:59');
-- insert into Signups (user_id, time_stamp) values ('2', '2020-07-29 23:09:44');
-- insert into Signups (user_id, time_stamp) values ('6', '2020-12-09 10:39:37');
-- Truncate table Confirmations;
-- insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout');
-- insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout');
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed');
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed');
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed');
-- insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed');
-- insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout');

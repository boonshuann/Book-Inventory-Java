INSERT INTO tblSubscriptionInfo (
subscription_id ,
product_id ,
product_name ,
subscription_start_date ,
subscription_end_date ,
customer_id ,
customer_phone_number ,
customer_address
)

VALUES 
(11, 1, 'apple', '2022-02-05 12:30:00', '2022-08-05 12:30:00', 111, '81234444', 'SERANGOON GARDENS'),
(12, 2, 'pear', '2022-02-06 12:30:00', '2022-08-05 12:30:00', 111, '81234444', 'SERANGOON GARDENS'),
(13, 3, 'banana', '2022-02-06 12:30:00', '2022-08-05 12:30:00', 111, '81234444', 'SERANGOON GARDENS'),

(14, 2, 'pear', '2022-03-12 12:30:00', '2022-08-15 12:30:00', 222, '81235555', 'SIXTH AVE'),
(15, 3, 'banana', '2022-03-13 12:30:00', '2022-08-15 12:30:00', 222, '81235555', 'SIXTH AVE'),

(16, 2, 'pear', '2022-04-10 12:30:00', '2022-06-10 12:30:00', 333, '81236666', 'TAMPINES'),
(17, 2, 'pear', '2022-06-15 12:30:00', '2022-07-16 12:30:00', 333, '81236666', 'TAMPINES'),
(18, 2, 'pear', '2022-08-12 12:30:00', '2022-09-16 12:30:00', 333, '81236666', 'TAMPINES'),

(19, 2, 'cherry 2020', '2020-01-05 12:30:00', '2020-09-16 12:30:00', 444, '81237777', 'BISHAN'),
(20, 2, 'cherry 2021', '2021-01-05 12:30:00', '2021-09-16 12:30:00', 444, '81237777', 'BISHAN'),
(21, 2, 'cherry 2023', '2022-01-05 12:30:00', '2023-09-16 12:30:00', 444, '81237777', 'BISHAN'),

(22, 2, 'cherry 2020', '2020-01-05 12:30:00', '2020-09-16 12:30:00', 555, '81238888', 'JURONG EAST'),
(23, 2, 'cherry 2021', '2021-01-05 12:30:00', '2021-09-16 12:30:00', 555, '81238888', 'JURONG EAST'),
(24, 2, 'cherry 2023', '2022-01-05 12:30:00', '2023-09-16 12:30:00', 555, '81238888', 'JURONG EAST')
;

-- DELETE FROM tblSubscriptionInfo

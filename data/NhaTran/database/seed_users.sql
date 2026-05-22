
INSERT INTO roles (id, created_at, updated_at, name, description)
VALUES (
'019e4eae-717d-71eb-a1e3-a8bff1a7b848',
'2025-01-01 08:00:00.000',
'2025-01-01 08:00:00.000',
'ADMIN',
'Quản trị viên'
);


INSERT INTO roles (id, created_at, updated_at, name, description)
VALUES (
'019e4eae-717e-7756-9994-aa00625da2a0',
'2025-01-01 08:00:00.000',
'2025-01-01 08:00:00.000',
'USER',
'Người dùng'
);


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71bc-7326-82bf-b9a72e5c8511', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'USER_CREATE_POST', 'Tạo bài viết mới');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71bd-7be2-9d67-cdf7480decca', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'USER_EDIT_OWN_POST', 'Cập nhật bài viết của mình');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71be-75dd-95ef-862579f07a80', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'USER_DELETE_OWN_POST', 'Xóa bài viết của mình');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71bf-723f-82b4-8536d2b67fa2', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'REACT_POST', 'Thả cảm xúc vào bài viết/bình luận');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c0-7ec6-a69e-0794cfb7e394', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'COMMENT_POST', 'Bình luận vào bài viết');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c1-74bc-b655-8ff89a2a5167', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'USER_DELETE_COMMENT', 'Xóa bình luận của chính mình');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c2-793a-aa30-1e4095a20222', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'USER_UPDATE_PASSWORD', 'Cập nhật thông tin hồ sơ cá nhân (profiles)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c3-7e38-a77d-ffc73e2ef2b9', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'BOOKMARK_POST', 'Lưu (bookmark) bài viết');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c4-70d5-8e23-92e23cacdfeb', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'REPORT_POST', 'Báo cáo bài viết hoặc nội dung vi phạm');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c5-70ba-9a89-02ac0cb6b738', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'DELETE_ANY_POST', 'Xóa bài viết của bất kỳ ai');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c6-7100-9ee6-e8ce049d426c', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'DELETE_ANY_COMMENT', 'Xóa bình luận của bất kỳ ai');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c7-7368-b544-8bc58e6770e4', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'BAN_USER', 'Khóa hoặc thay đổi trạng thái tài khoản người dùng');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c8-7df3-a02a-15cc54309c6b', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_ROLES', 'Quản lý vai trò và phân quyền hệ thống');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71c9-7ec1-b1ae-834b83c51564', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'REVIEW_MODERATION_QUEUE', 'Duyệt, phê duyệt hoặc từ chối bài viết trong hàng đợi (moderation_queue)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71ca-71aa-87bf-24546460bacb', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_REPORTS', 'Xử lý, đánh giá trạng thái các báo cáo vi phạm (reports)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71cb-751a-bd22-2b43d628c712', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_SENSITIVE_KEYWORDS', 'Thêm, sửa, xóa từ khóa nhạy cảm (sensitive_keywords)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71cc-7fd0-a58c-6e3859f36b20', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_HISTORICAL_KNOWLEDGE', 'Quản lý kho dữ liệu kiến thức lịch sử (historical_knowledge)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71cd-7c7d-9251-c438d0e54c41', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_ON_THIS_DAY', 'Quản lý sự kiện ''Ngày này năm xưa'' (on_this_day)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71ce-7d3f-b9f4-ffa0580370a0', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'MANAGE_TAGS', 'Quản lý và dọn dẹp các thẻ (tags)');


INSERT INTO app_permissions (id, created_at, updated_at, name, description)
VALUES ('019e4eae-71cf-79dd-a31e-c577aa5080ef', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000', 'VIEW_TRENDING_SCORES', 'Xem thống kê chỉ số tương tác và điểm thịnh hành (trending_scores)');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71bc-7326-82bf-b9a72e5c8511');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71bc-7326-82bf-b9a72e5c8511');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71bd-7be2-9d67-cdf7480decca');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71bd-7be2-9d67-cdf7480decca');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71be-75dd-95ef-862579f07a80');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71be-75dd-95ef-862579f07a80');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71bf-723f-82b4-8536d2b67fa2');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71bf-723f-82b4-8536d2b67fa2');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c0-7ec6-a69e-0794cfb7e394');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c1-74bc-b655-8ff89a2a5167');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71c1-74bc-b655-8ff89a2a5167');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c2-793a-aa30-1e4095a20222');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c3-7e38-a77d-ffc73e2ef2b9');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71c3-7e38-a77d-ffc73e2ef2b9');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c4-70d5-8e23-92e23cacdfeb');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717e-7756-9994-aa00625da2a0', '019e4eae-71c4-70d5-8e23-92e23cacdfeb');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c5-70ba-9a89-02ac0cb6b738');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c6-7100-9ee6-e8ce049d426c');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c7-7368-b544-8bc58e6770e4');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c8-7df3-a02a-15cc54309c6b');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71c9-7ec1-b1ae-834b83c51564');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71ca-71aa-87bf-24546460bacb');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71cb-751a-bd22-2b43d628c712');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71cc-7fd0-a58c-6e3859f36b20');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71cd-7c7d-9251-c438d0e54c41');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71ce-7d3f-b9f4-ffa0580370a0');


INSERT INTO role_permissions (role_id, permission_id)
VALUES ('019e4eae-717d-71eb-a1e3-a8bff1a7b848', '019e4eae-71cf-79dd-a31e-c577aa5080ef');


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d0-7f6a-aa43-53651a991342',
'2026-02-13 07:55:15',
'2026-02-13 07:55:15',
'user1@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d1-76ab-bfa0-5c6b67b717b5',
'2026-01-11 07:55:15',
'2026-01-11 07:55:15',
'user2@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d2-7b79-b12a-03e3c7e17d17',
'2026-04-29 07:55:15',
'2026-04-29 07:55:15',
'user3@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d3-730b-afc4-210c7f94f3b9',
'2025-05-24 07:55:15',
'2025-05-24 07:55:15',
'user4@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d4-7424-bc50-0e6ff1d623e1',
'2025-10-10 07:55:15',
'2025-10-10 07:55:15',
'user5@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d5-7e4f-a373-cf185fb7489e',
'2026-05-21 07:55:15',
'2026-05-21 07:55:15',
'user6@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d6-7792-aec4-6c40cfd028f4',
'2025-08-28 07:55:15',
'2025-08-28 07:55:15',
'user7@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d7-752a-9af2-32b1a001f047',
'2025-08-19 07:55:15',
'2025-08-19 07:55:15',
'user8@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d8-79e8-84f6-483c2c830f6f',
'2025-06-04 07:55:15',
'2025-06-04 07:55:15',
'user9@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71d9-7d2c-a73d-5cf4f8df974d',
'2025-06-12 07:55:15',
'2025-06-12 07:55:15',
'user10@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71da-7553-9436-32c988b9def4',
'2026-02-10 07:55:15',
'2026-02-10 07:55:15',
'user11@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71db-7af1-bfe1-b2249485ff0a',
'2025-11-16 07:55:15',
'2025-11-16 07:55:15',
'user12@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71dc-759c-9320-5fdfc6e2a4e8',
'2025-10-13 07:55:15',
'2025-10-13 07:55:15',
'user13@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71dd-7dea-808b-e2c2f1659ebb',
'2026-04-16 07:55:15',
'2026-04-16 07:55:15',
'user14@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71de-727a-a090-454f367cf2e7',
'2025-06-15 07:55:15',
'2025-06-15 07:55:15',
'user15@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71df-7a78-afdc-2976b44fc7df',
'2025-12-03 07:55:15',
'2025-12-03 07:55:15',
'user16@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e0-7c13-a5ce-53b4f021d265',
'2025-07-06 07:55:15',
'2025-07-06 07:55:15',
'user17@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e1-7d0c-84d3-e24faba96c12',
'2025-12-12 07:55:15',
'2025-12-12 07:55:15',
'user18@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e2-7f4e-a0f9-c08845a81638',
'2025-06-16 07:55:15',
'2025-06-16 07:55:15',
'user19@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e3-7d01-b22b-b381394bde7b',
'2026-03-19 07:55:15',
'2026-03-19 07:55:15',
'user20@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e4-728b-80fc-9943d8b4d98d',
'2025-12-19 07:55:15',
'2025-12-19 07:55:15',
'user21@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e5-77c8-b621-94c486d65adf',
'2025-09-04 07:55:15',
'2025-09-04 07:55:15',
'user22@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e6-7e46-8f59-a3ca647b9ebd',
'2025-12-14 07:55:15',
'2025-12-14 07:55:15',
'user23@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e7-7d01-87ca-b62bd8cb4789',
'2025-06-14 07:55:15',
'2025-06-14 07:55:15',
'user24@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e8-78f4-a0eb-581446087c9b',
'2025-10-24 07:55:15',
'2025-10-24 07:55:15',
'user25@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71e9-7262-b21f-f080d0377e5f',
'2025-12-05 07:55:15',
'2025-12-05 07:55:15',
'user26@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ea-7435-8246-5d65a243d586',
'2025-10-27 07:55:15',
'2025-10-27 07:55:15',
'user27@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71eb-70cd-a046-c53afbde2c8b',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'user28@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ec-7341-a302-e66504f69a27',
'2025-12-21 07:55:15',
'2025-12-21 07:55:15',
'user29@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ed-7df9-99c9-91624f6bc58e',
'2025-08-11 07:55:15',
'2025-08-11 07:55:15',
'user30@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ee-7cb2-b296-83bb36bfea88',
'2026-03-17 07:55:15',
'2026-03-17 07:55:15',
'user31@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ef-7a81-b8aa-c6b6da5da6e9',
'2026-02-12 07:55:15',
'2026-02-12 07:55:15',
'user32@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f0-7a7c-aebe-d78d942756ce',
'2025-10-18 07:55:15',
'2025-10-18 07:55:15',
'user33@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f1-74b3-8982-188df55858f6',
'2025-06-15 07:55:15',
'2025-06-15 07:55:15',
'user34@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f2-78df-bab9-1564272cceb8',
'2025-11-08 07:55:15',
'2025-11-08 07:55:15',
'user35@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f3-74b6-b03d-30906bd80322',
'2025-06-09 07:55:15',
'2025-06-09 07:55:15',
'user36@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f4-7776-af2f-ec029765d16d',
'2026-02-21 07:55:15',
'2026-02-21 07:55:15',
'user37@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f5-75ef-aa50-8c0e17daec19',
'2025-07-10 07:55:15',
'2025-07-10 07:55:15',
'user38@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f6-7540-98e8-337af35da210',
'2025-08-03 07:55:15',
'2025-08-03 07:55:15',
'user39@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f7-7dd3-9b29-8f8745327e74',
'2025-12-18 07:55:15',
'2025-12-18 07:55:15',
'user40@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f8-725f-b7e3-a0a4a7e0b98a',
'2025-10-26 07:55:15',
'2025-10-26 07:55:15',
'user41@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71f9-700d-88d9-5de301a01b9f',
'2025-08-14 07:55:15',
'2025-08-14 07:55:15',
'user42@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71fa-7ddf-8abb-bc8907edc72e',
'2026-05-21 07:55:15',
'2026-05-21 07:55:15',
'user43@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71fb-7521-ae78-322c73f35ced',
'2025-12-17 07:55:15',
'2025-12-17 07:55:15',
'user44@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71fc-72cc-8418-fdd7996020ba',
'2025-12-26 07:55:15',
'2025-12-26 07:55:15',
'user45@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71fd-7a87-a560-ed59adfd1292',
'2026-02-03 07:55:15',
'2026-02-03 07:55:15',
'user46@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71fe-7581-8d57-54934d5db3e1',
'2025-10-13 07:55:15',
'2025-10-13 07:55:15',
'user47@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-71ff-7f89-b53c-c98c8c8b7025',
'2025-07-29 07:55:15',
'2025-07-29 07:55:15',
'user48@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7200-7d0d-839a-9b001a052932',
'2025-07-15 07:55:15',
'2025-07-15 07:55:15',
'user49@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7201-7c03-b188-48a65da29124',
'2025-06-20 07:55:15',
'2025-06-20 07:55:15',
'user50@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7202-79a4-97c8-815296b9a663',
'2025-12-08 07:55:15',
'2025-12-08 07:55:15',
'user51@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7203-7be8-9d42-355670e1c490',
'2025-09-25 07:55:15',
'2025-09-25 07:55:15',
'user52@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7204-77c8-8be0-7e812b0b9d83',
'2025-10-07 07:55:15',
'2025-10-07 07:55:15',
'user53@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7205-7766-9119-099a9e31dbde',
'2025-10-07 07:55:15',
'2025-10-07 07:55:15',
'user54@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7206-71b6-811e-0b516a2486c3',
'2025-06-10 07:55:15',
'2025-06-10 07:55:15',
'user55@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7207-7ac6-8ebf-877229f39d6a',
'2026-02-01 07:55:15',
'2026-02-01 07:55:15',
'user56@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7208-7f08-bf81-1e1372da730f',
'2025-09-02 07:55:15',
'2025-09-02 07:55:15',
'user57@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7209-7602-9a34-173e30dedcab',
'2025-09-21 07:55:15',
'2025-09-21 07:55:15',
'user58@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720a-722d-8220-62d9e081e134',
'2026-02-24 07:55:15',
'2026-02-24 07:55:15',
'user59@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720b-7da5-b7a1-fd44b50d3b7d',
'2025-06-18 07:55:15',
'2025-06-18 07:55:15',
'user60@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720c-7464-b6c1-7dcc80923643',
'2026-04-08 07:55:15',
'2026-04-08 07:55:15',
'user61@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720d-747b-8c72-d117997cb319',
'2025-12-27 07:55:15',
'2025-12-27 07:55:15',
'user62@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720e-7058-9e7e-8e12ad852c7c',
'2025-08-31 07:55:15',
'2025-08-31 07:55:15',
'user63@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-720f-7a4a-8d89-89cc39536c64',
'2025-06-16 07:55:15',
'2025-06-16 07:55:15',
'user64@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7210-7b0f-9891-93ee2715cdf1',
'2025-07-01 07:55:15',
'2025-07-01 07:55:15',
'user65@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7211-7d7c-998d-adf0bf978de7',
'2025-07-08 07:55:15',
'2025-07-08 07:55:15',
'user66@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7212-725c-a310-bca74fc22932',
'2025-12-01 07:55:15',
'2025-12-01 07:55:15',
'user67@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7213-71dd-91ee-1af48d90c857',
'2026-04-04 07:55:15',
'2026-04-04 07:55:15',
'user68@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7214-7f2d-b59d-cc7da6e87ea2',
'2026-01-21 07:55:15',
'2026-01-21 07:55:15',
'user69@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7215-706b-809f-6ec2e1658678',
'2025-06-11 07:55:15',
'2025-06-11 07:55:15',
'user70@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7216-7fc2-9d38-a8a11f2962dc',
'2025-12-14 07:55:15',
'2025-12-14 07:55:15',
'user71@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7217-7106-9ea1-ab200e2c6ec2',
'2026-01-26 07:55:15',
'2026-01-26 07:55:15',
'user72@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7218-7a02-bbdf-305d1f1c7b3c',
'2026-02-09 07:55:15',
'2026-02-09 07:55:15',
'user73@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7219-797f-930d-dee6b3327aa1',
'2026-03-07 07:55:15',
'2026-03-07 07:55:15',
'user74@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721a-7bae-b953-05be29912692',
'2026-05-09 07:55:15',
'2026-05-09 07:55:15',
'user75@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721b-76eb-b045-f2c4681c6314',
'2026-04-28 07:55:15',
'2026-04-28 07:55:15',
'user76@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721c-73c0-9340-7a9f9ba29730',
'2026-01-16 07:55:15',
'2026-01-16 07:55:15',
'user77@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721d-72db-b29d-a50e8904d6aa',
'2025-09-20 07:55:15',
'2025-09-20 07:55:15',
'user78@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721e-7457-b6b1-297fa29634f0',
'2025-07-13 07:55:15',
'2025-07-13 07:55:15',
'user79@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-721f-7cb0-acb2-8ad6d7a7c85f',
'2026-04-14 07:55:15',
'2026-04-14 07:55:15',
'user80@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7220-7480-9d88-eff78ded1e54',
'2025-09-30 07:55:15',
'2025-09-30 07:55:15',
'user81@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7221-7fdc-ba3d-b68aadb31db2',
'2025-10-21 07:55:15',
'2025-10-21 07:55:15',
'user82@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7222-7fc6-af44-9658cbd3fe1c',
'2025-07-03 07:55:15',
'2025-07-03 07:55:15',
'user83@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7223-78d4-8a08-a8150f6b17bb',
'2025-07-31 07:55:15',
'2025-07-31 07:55:15',
'user84@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7224-775b-979b-9958ac2b8b8b',
'2026-02-11 07:55:15',
'2026-02-11 07:55:15',
'user85@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7225-7884-b4fd-2a6afb8a7b76',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'user86@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7226-7936-a82d-a73f55a768b8',
'2025-11-06 07:55:15',
'2025-11-06 07:55:15',
'user87@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7227-7bac-be6c-7ed468a3634b',
'2025-09-10 07:55:15',
'2025-09-10 07:55:15',
'user88@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7228-7ff6-8260-14f843b426b5',
'2025-10-29 07:55:15',
'2025-10-29 07:55:15',
'user89@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7229-74cf-827f-790a3410b202',
'2026-01-17 07:55:15',
'2026-01-17 07:55:15',
'user90@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722a-7d88-a522-5ab60ce4ede1',
'2026-03-07 07:55:15',
'2026-03-07 07:55:15',
'user91@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722b-7019-b2f7-2f225bdbde7b',
'2025-06-20 07:55:15',
'2025-06-20 07:55:15',
'user92@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722c-75ff-a174-3f35d44ba863',
'2025-06-03 07:55:15',
'2025-06-03 07:55:15',
'user93@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722d-7949-be88-2e32d168015c',
'2026-05-19 07:55:15',
'2026-05-19 07:55:15',
'user94@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722e-799b-b91a-6c9e67908a78',
'2026-03-28 07:55:15',
'2026-03-28 07:55:15',
'user95@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-722f-7b21-aa96-965ad24446a6',
'2025-10-16 07:55:15',
'2025-10-16 07:55:15',
'user96@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7230-7a1b-aeee-8a5c1c2f0aa0',
'2026-01-29 07:55:15',
'2026-01-29 07:55:15',
'user97@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7231-735c-97f1-99bcc04a6d9b',
'2026-02-20 07:55:15',
'2026-02-20 07:55:15',
'user98@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7232-77ad-ae57-8244364a8b80',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'user99@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO users (id, created_at, updated_at, email, password, status)
VALUES (
'019e4eae-7233-78e6-b42c-a37fd000de67',
'2025-08-29 07:55:15',
'2025-08-29 07:55:15',
'user100@history.vn',
'$2b$12$LbDbLXFCtHgfHOm2RaO8T.EpbUj/Qg3SDPpDNdsR4BWP1QirvAznq',
'ACTIVE'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d0-7f6a-aa43-53651a991342',
'2026-02-13 07:55:15',
'2026-02-13 07:55:15',
'https://drive.google.com/uc?id=1RQ4pMOZdIpdwKKAYXe39kBS_E4oONLbe',
'Điều trong cho chưa từ cũng một. Cũng từ của thì giữa.
Về người đó này làm.
Mà là có nhiều có nhưng thì. Nếu nhiều số tự từ cái mỗi. Bạn hoặc nhiều theo người.',
'Chị Vân Trần',
'user1',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d1-76ab-bfa0-5c6b67b717b5',
'2026-01-11 07:55:15',
'2026-01-11 07:55:15',
'https://drive.google.com/uc?id=1wGJbmWAU6Pv3tuoVzaaxwb2Xr3uR8fNq',
'Tôi nếu cái nơi của. Vậy vẫn với bên từ. Là cũng với thay lớn tự để.
Để để cho này cho mà. Có để từng để người cho vài.
Khiến vẫn dưới thay. Tự bên giữa dưới.',
'Chị Hà Nguyễn',
'user2',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d2-7b79-b12a-03e3c7e17d17',
'2026-04-29 07:55:15',
'2026-04-29 07:55:15',
'https://drive.google.com/uc?id=1RkIYuo9GGISkoUqgTfN1KxBXwS5fGyIm',
'Một đang cái mỗi chỉ hoặc. Vẫn đang nơi từ vài. Vậy cách giống từ hơn.
Mỗi nào của người được trong sẽ vài. Như một khi khi không có bên. Hoặc của cách với.',
'Bảo Nguyễn',
'user3',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d3-730b-afc4-210c7f94f3b9',
'2025-05-24 07:55:15',
'2025-05-24 07:55:15',
'https://drive.google.com/uc?id=1-aDcZ6lYuAC2SKMmbLZIAMad0L_2RZ4Z',
'Sau với nào người với.
Bạn tự theo khi.
Hơn của đã như. Từng dưới bạn đó.
Cũng sẽ của người người mỗi. Vẫn điều tại dưới sau vì. Điều đúng khiến hơn rất.',
'Bà Khoa Lê',
'user4',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d4-7424-bc50-0e6ff1d623e1',
'2025-10-10 07:55:15',
'2025-10-10 07:55:15',
'https://drive.google.com/uc?id=1l64efPA9I1-GgMb5pTZqeFbHT63hKQCs',
'Nhưng có nào bên số nhiều số. Như có từ vậy vài như đó. Nhưng như như để từ cách sau giữa.
Vẫn tại hơn điều như có lớn. Được vì trong nếu khi điều số rất. Nếu hơn điều.',
'Khoa Đặng',
'user5',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d5-7e4f-a373-cf185fb7489e',
'2026-05-21 07:55:15',
'2026-05-21 07:55:15',
'https://drive.google.com/uc?id=1GX2qCeVbMLVaWCmjZpEvG28nOGUSXOlh',
'Khiến về bên mỗi.
Chỉ như tại để như dưới đó như. Sau giống đi dưới nào.
Để với trong nếu cái với cho. Chỉ mỗi dưới nào nhưng như có. Từng tại như đúng trong về.
Bên nào sẽ thế của.',
'Chị Linh Hoàng',
'user6',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d6-7792-aec4-6c40cfd028f4',
'2025-08-28 07:55:15',
'2025-08-28 07:55:15',
'https://drive.google.com/uc?id=1my-_NSYUH6ZdVgiCZAIHP4iveCEDiiAw',
'Thay như từ bạn tôi đó từng. Tôi cũng cũng để. Như tôi đó để.
Khi cũng cách khi trong đang số. Từ là nào để để tự như.
Trong để và tôi trong hơn. Vài tại khiến của vài đã.',
'Trung Trí Hoàng',
'user7',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d7-752a-9af2-32b1a001f047',
'2025-08-19 07:55:15',
'2025-08-19 07:55:15',
'https://drive.google.com/uc?id=1Jw0OEmbKhQMHspNaPpFWoCXRHItpEGUf',
'Về nhưng cái tự từ cách vài. Từ rất giữa từ theo. Sau từ theo giữa lớn sau.
Có thế đúng điều một như. Gần trong có nhiều đã khiến từ.',
'Chị Lâm Đặng',
'user8',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d8-79e8-84f6-483c2c830f6f',
'2025-06-04 07:55:15',
'2025-06-04 07:55:15',
'https://drive.google.com/uc?id=1AhdBRvr1puf1gdlXBbuKd0f43mmxqbPm',
'Theo tôi về dưới tôi trong vậy không. Về như như chưa như đó vài. Theo cho theo cho từ đến đi.
Có tại chỉ của nơi một mà. Đó gần số là nào.',
'Quý cô Kim Phạm',
'user9',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71d9-7d2c-a73d-5cf4f8df974d',
'2025-06-12 07:55:15',
'2025-06-12 07:55:15',
'https://drive.google.com/uc?id=1DxA-Zu6rBqd3L1zSHfEdPpG2cwpvDK-M',
'Chỉ chỉ này vậy. Đang nơi chỉ giữa để. Chỉ thay hơn giữa nơi nếu nếu.
Vài dưới lớn gần chưa. Người từ của từ mà trong trong về.
Trong nhưng đến bạn để nếu. Về về hơn có.',
'Bác Phúc Vũ',
'user10',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71da-7553-9436-32c988b9def4',
'2026-02-10 07:55:15',
'2026-02-10 07:55:15',
'https://drive.google.com/uc?id=1ZBCOlR6JzcPCrfsc6iSQT3feiNkCaI5p',
'Đúng vẫn để các nếu. Từ đó được.
Như tại mỗi là. Đó vậy một gần.
Nào đúng cho tại. Cũng cho thay các giữa. Vài và từ các hơn dưới.
Các chỉ để với từ giống. Thì như như tự thì.',
'Nhật Bảo Lê',
'user11',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71db-7af1-bfe1-b2249485ff0a',
'2025-11-16 07:55:15',
'2025-11-16 07:55:15',
'https://drive.google.com/uc?id=1XLwTFSBkIt8lb92l36zM9PnYac51xhYO',
'Mỗi rất giống các hơn. Từ là cũng với. Hơn như về thế.
Giữa giữa như từng trong tôi. Cách thì rất nhiều. Gần hơn là.
Cái các khi được không. Đó về khiến như tại một. Vài mỗi đã và của có.',
'Cô Hồng Trần',
'user12',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71dc-759c-9320-5fdfc6e2a4e8',
'2025-10-13 07:55:15',
'2025-10-13 07:55:15',
'https://drive.google.com/uc?id=1Y8Bk3yiYbCOrAF67iqJ8jv2BEzVOqg6w',
'Số một gần đó khi vì bên. Nơi không về đến. Hơn số nhiều sẽ.
Cũng thế người giữa trong sau hơn. Bạn thay hơn là. Cách chưa từ tôi vẫn nơi.',
'Quý ông Khoa Đặng',
'user13',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71dd-7dea-808b-e2c2f1659ebb',
'2026-04-16 07:55:15',
'2026-04-16 07:55:15',
'https://drive.google.com/uc?id=1bGIOHnWunjt9h0jeYsMw-lPhavQy48FY',
'Tại trong cũng tại để như.
Vẫn mỗi cũng cũng tự trong như. Để vì đúng dưới bên đó khi. Về chỉ từng của. Điều dưới đi giống.
Cách sau nhưng để nào để này trong. Đang đến đi rất trong số.',
'Quý cô Vân Đặng',
'user14',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71de-727a-a090-454f367cf2e7',
'2025-06-15 07:55:15',
'2025-06-15 07:55:15',
'https://drive.google.com/uc?id=1x2JYs2KWSh7mtaeBb1dG-uwBZkN4OxFe',
'Hơn hoặc tại sau vẫn của nơi. Hơn nếu đúng hơn. Đi từ có của là.
Cũng vẫn tôi tại như. Khiến tại về cái hơn để.
Không như lớn một khiến từng. Người nhưng nhưng bạn. Của tôi sẽ các bạn đi đó người.',
'Bà Nhật Bùi',
'user15',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71df-7a78-afdc-2976b44fc7df',
'2025-12-03 07:55:15',
'2025-12-03 07:55:15',
'https://drive.google.com/uc?id=1BD9i-hTGknUpZQTbxSWXVArc2dqdZkTt',
'Giữa từ như trong vậy. Tại cách gần. Dưới tại hơn thì lớn đang.
Của tự các thì điều đến một. Này đi nhưng khi.
Một thay được vài. Trong các cũng cái các thì lớn. Như từ đó với và có.',
'Ngọc Hoàng',
'user16',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e0-7c13-a5ce-53b4f021d265',
'2025-07-06 07:55:15',
'2025-07-06 07:55:15',
'https://drive.google.com/uc?id=1UVw0EDOW5PN56vk6ijMICbEAskTR1ILJ',
'Như với hơn từ để. Không có tại không.
Hoặc lớn tại với. Nào bên để có giữa dưới từ. Rất khiến tôi không sẽ với.
Lớn nào là tôi chưa. Sẽ để để bên sau. Để lớn giữa khiến thế đúng có theo.',
'Tú Trần',
'user17',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e1-7d0c-84d3-e24faba96c12',
'2025-12-12 07:55:15',
'2025-12-12 07:55:15',
'https://drive.google.com/uc?id=1NH8iXNQ8O8T-gvWhXuPu4IVtPfcaYt1A',
'Sẽ từ đó nếu như. Có số nhưng. Nào nào nhưng với như không trong.
Nếu nhiều sẽ. Để chưa sẽ đúng đã với để cũng. Chưa khi các nơi giống. Nào từ không như vì có tại.',
'Phương Xuân Vũ',
'user18',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e2-7f4e-a0f9-c08845a81638',
'2025-06-16 07:55:15',
'2025-06-16 07:55:15',
'https://drive.google.com/uc?id=1QF-LoOE4v6is1hdnr4YC70LpNTzB28tm',
'Thế trong tôi nơi dưới. Đi để từ đó từ.
Như bên khi tại từng này khiến. Được như thì bạn nhưng và. Gần của hoặc từ của. Tôi có mà người đã.
Nhưng của vì. Và với tự. Trong như cũng với trong đã.',
'Nhật Hoàng',
'user19',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e3-7d01-b22b-b381394bde7b',
'2026-03-19 07:55:15',
'2026-03-19 07:55:15',
'https://drive.google.com/uc?id=1G5ky8QTN7KThOPi1MNwdL-qOetK9Aov-',
'Như nơi cũng mỗi giống. Đang bên giống nơi hơn.
Của nơi dưới từ điều cách như. Nếu là sau hoặc như sẽ.
Đã để với với. Làm từ đã vẫn.
Và hoặc nơi cho đã vậy. Lớn để bạn để cho.
Từ với có từng.',
'Chi Hoàng',
'user20',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e4-728b-80fc-9943d8b4d98d',
'2025-12-19 07:55:15',
'2025-12-19 07:55:15',
'https://drive.google.com/uc?id=1E-dMg_QRKAXslr99IKwH6AJL38eMrYj5',
'Một cũng khi đến. Từ với nào thay đúng theo thì. Từ bên thay của các.
Từng đi đúng gần mà này. Thế từ nhiều được đi mỗi của. Chưa giữa cách gần thế mà giữa.',
'Lâm Trần',
'user21',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e5-77c8-b621-94c486d65adf',
'2025-09-04 07:55:15',
'2025-09-04 07:55:15',
'https://drive.google.com/uc?id=1qKf3d8ZI_3iYq3EEfTMdL32oVqVa8SB2',
'Như đi cũng sẽ. Cái mà mà sau này điều tại.
Gần theo điều về sau với. Của sẽ tự điều là vẫn. Để không của về nơi trong để.
Từ đã khiến chưa với để một. Của hơn bên tại chỉ khi được.',
'Hải Phú Mai',
'user22',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e6-7e46-8f59-a3ca647b9ebd',
'2025-12-14 07:55:15',
'2025-12-14 07:55:15',
'https://drive.google.com/uc?id=1TNDAbR2cWcG7_21MKGuOi_w8A_B2jnL1',
'Thì đi các nào dưới. Làm là đúng giống. Thay giữa như từ.
Như là giữa. Như có là có và với.
Của đến thế sau dưới này. Vài gần bạn đến là.
Điều chưa của giữa mà.',
'Anh Hoàng',
'user23',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e7-7d01-87ca-b62bd8cb4789',
'2025-06-14 07:55:15',
'2025-06-14 07:55:15',
'https://drive.google.com/uc?id=1uIvPh94taEqYCNoQPmdmHClMZlfQfY6I',
'Như thì thì bạn cũng có sau. Hơn được từng làm không để.
Và như và của. Nhiều cái rất nơi tại của. Này là trong giống và được điều.',
'Phương Trí Đặng',
'user24',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e8-78f4-a0eb-581446087c9b',
'2025-10-24 07:55:15',
'2025-10-24 07:55:15',
'https://drive.google.com/uc?id=15QNYo2M4fHJ2GG-R_X9bH3Ll4SkLYCYu',
'Cũng hoặc nơi khi chưa để. Từ cái đang cũng trong. Rất thay theo vậy lớn mà thì. Của như cho.
Được không chỉ nào cũng bên theo. Của hơn trong làm số giữa như là.',
'Anh Phúc Đặng',
'user25',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71e9-7262-b21f-f080d0377e5f',
'2025-12-05 07:55:15',
'2025-12-05 07:55:15',
'https://drive.google.com/uc?id=1lOgQiDAHi1Uk0ddlqKmX1vHaJLgr6ebC',
'Là đến bên hoặc. Nơi như của tôi giống. Nào người để người theo đến.
Đang đã của tại cách tại. Làm là tôi số không.
Chỉ tại có sẽ và như tự. Cũng đi nhưng của như.',
'Vũ Vũ',
'user26',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ea-7435-8246-5d65a243d586',
'2025-10-27 07:55:15',
'2025-10-27 07:55:15',
'https://drive.google.com/uc?id=1WkfjhX7wBbbEO0BitphGrXUjb9p0Gt9b',
'Giữa làm vài vì được nhiều. Cũng cách đã điều.
Sẽ này lớn từ. Nơi chỉ đã sẽ như có.
Để như vẫn từng khi tại. Giống nếu chỉ vài vì. Trong đang từ một với. Của cũng của trong như vậy nhiều.',
'Chi Trần',
'user27',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71eb-70cd-a046-c53afbde2c8b',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'https://drive.google.com/uc?id=1I9R75Bnlyt0WfciS96ZlQF_sjhLAe5cx',
'Từ thì với. Vì để số.
Thay này làm giữa bên lớn của. Của để hơn đến. Nhưng mà và hoặc của với bên.
Cũng như thay cách. Như đúng vẫn vẫn này. Khiến cũng cách khi.',
'Bà Ngọc Phạm',
'user28',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ec-7341-a302-e66504f69a27',
'2025-12-21 07:55:15',
'2025-12-21 07:55:15',
'https://drive.google.com/uc?id=13uXxAs-J_fiskfXbgesyHZ2B2Rl4a7xf',
'Từ sẽ vậy giữa thì khiến không. Của khiến đang từng cái như. Theo đã nếu khiến hoặc vẫn.
Thay từ để các. Trong khiến này bên hơn tự rất.',
'Hải Phạm',
'user29',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ed-7df9-99c9-91624f6bc58e',
'2025-08-11 07:55:15',
'2025-08-11 07:55:15',
'https://drive.google.com/uc?id=13AeMP_76lcSiONrcy9VoeXUhrf5A5XZz',
'Nào như một đi nào giống đúng. Điều là đúng khi.
Để điều lớn tôi. Thì vài khi đến sẽ để. Khi từ nơi hơn.
Theo của là tự. Làm như có sẽ đến thì từng. Như nhiều của để số nhiều.',
'Bác Huy Vũ',
'user30',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ee-7cb2-b296-83bb36bfea88',
'2026-03-17 07:55:15',
'2026-03-17 07:55:15',
'https://drive.google.com/uc?id=1aCYPdEzruQp256SDhtb43MdFbHJRpFA3',
'Cũng số của bạn nơi nơi. Giống của này đúng và. Từ theo vì từng này.
Làm với từ chỉ. Nhiều như nếu vài với được.
Hoặc tự nơi từ từ vậy. Về lớn lớn các chưa với. Của đang là có tự.',
'Nam Đức Dương',
'user31',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ef-7a81-b8aa-c6b6da5da6e9',
'2026-02-12 07:55:15',
'2026-02-12 07:55:15',
'https://drive.google.com/uc?id=1StXdXiekq2ZGXSW4MBJZsN2At4w_DlXh',
'Đã với tại đến.
Người đến cái bên cũng như gần. Khiến hoặc các thì nào rất. Rất đi hơn đã nơi. Như cách từ dưới bên khi.
Của tự sau dưới giữa tại. Nào thì bên thì cách.',
'Cô Hồng Mai',
'user32',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f0-7a7c-aebe-d78d942756ce',
'2025-10-18 07:55:15',
'2025-10-18 07:55:15',
'https://drive.google.com/uc?id=1MIMyUJTOJV1RDaqw_xnm5V4ADG94Kf--',
'Khiến như lớn rất từng. Đi chưa lớn bạn lớn vì như.
Vài khiến chỉ giống. Chưa của cách hơn để cũng. Cũng sẽ khiến của trong giống trong.
Tại này có như khiến.
Một để là cũng mỗi có.',
'Khoa Hải Trần',
'user33',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f1-74b3-8982-188df55858f6',
'2025-06-15 07:55:15',
'2025-06-15 07:55:15',
'https://drive.google.com/uc?id=1VpF0vFuE2xkJ-7695dKf3LlECxT5zVUS',
'Được trong đi. Giữa khi chỉ cái như đó theo bên. Chỉ cái lớn mỗi số từng tự.
Thì để cũng như. Vẫn thế thay hơn đi của sẽ.
Với vài này tôi này cho của. Này mỗi giữa cho từng mỗi cho. Sau làm tôi đã.',
'Trung Đức Trần',
'user34',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f2-78df-bab9-1564272cceb8',
'2025-11-08 07:55:15',
'2025-11-08 07:55:15',
'https://drive.google.com/uc?id=12jQyoifOsq796ofP06surdy91hH3ithU',
'Như nơi có. Trong khi chưa một mỗi. Như giữa rất mỗi vì thay cái.
Tại cũng rất để. Không để mỗi gần.
Từng như giữa như. Cũng nào tôi và. Số người cũng giống đã khi giống.',
'Bác Vũ Hoàng',
'user35',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f3-74b6-b03d-30906bd80322',
'2025-06-09 07:55:15',
'2025-06-09 07:55:15',
'https://drive.google.com/uc?id=18jFtB4IRl0y6HxhNSCiNPPPdkLEy7xVF',
'Trong được hơn khiến cũng số cách cho. Nhưng này điều đến hơn để cũng.
Nhưng người nhưng cái của. Làm sau có thì mà một. Được một không trong đã đang. Đang nhưng vẫn đang thế.',
'Bác Trung Phạm',
'user36',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f4-7776-af2f-ec029765d16d',
'2026-02-21 07:55:15',
'2026-02-21 07:55:15',
'https://drive.google.com/uc?id=1ZSfC_DZcAX2sSPdh-KuJ5fdZOeHKsyBu',
'Cũng về này trong. Trong trong về của một để làm. Thay hơn dưới từng vài. Chỉ có như sau là này của có.
Hoặc đang từ vì trong sẽ theo. Của đã một. Trong đó nếu rất có như cách các.',
'Chị Ngọc Lê',
'user37',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f5-75ef-aa50-8c0e17daec19',
'2025-07-10 07:55:15',
'2025-07-10 07:55:15',
'https://drive.google.com/uc?id=1I9ZYdxktRaAA-ecHrDX9qEaUOcRBcKIO',
'Làm rất mà gần hơn làm nhiều. Sau hơn cũng đúng của một.
Nhiều sau cái như điều. Mà theo chỉ tại từ.
Giữa nào các để. Nhưng về làm với. Vậy lớn có khi gần cũng không.',
'Anh Trung Nguyễn',
'user38',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f6-7540-98e8-337af35da210',
'2025-08-03 07:55:15',
'2025-08-03 07:55:15',
'https://drive.google.com/uc?id=1CCMhuEToWB4Uzd78oDxM-P1cjNwDt3SE',
'Trong đó cách làm khiến từ. Này thì tại cho hơn như. Không là về giữa vẫn sẽ các. Sẽ vậy vậy rất gần làm trong.
Với không cái đúng. Vẫn đến số cách. Đúng khi từng với sau đó.',
'Vi Dương',
'user39',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f7-7dd3-9b29-8f8745327e74',
'2025-12-18 07:55:15',
'2025-12-18 07:55:15',
'https://drive.google.com/uc?id=1tmNuIReDdI7Qq4AwTtISKg3AFJE4alPJ',
'Để khiến làm đúng như của. Này mỗi này cho để tại đó đó.
Một một theo. Vẫn từ bên đó đã lớn nhiều.
Trong nào giống thế. Chỉ cho mà đến. Tại từ số vậy để về không để.',
'Quý cô Hà Lê',
'user40',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f8-725f-b7e3-a0a4a7e0b98a',
'2025-10-26 07:55:15',
'2025-10-26 07:55:15',
'https://drive.google.com/uc?id=15-3iKq7guE9R3ktUfqV4yJlC4Uwe9fUP',
'Nếu vì vài vẫn tại. Như một khi trong sau. Bạn mà đang như.
Bên là cũng là rất. Gần nhiều để sau rất mà vẫn các.
Lớn người khiến nơi lớn. Cho giống nhưng một tôi như từng có.',
'Quý cô Lan Đặng',
'user41',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71f9-700d-88d9-5de301a01b9f',
'2025-08-14 07:55:15',
'2025-08-14 07:55:15',
'https://drive.google.com/uc?id=16FwNjpwdNYlG64UkVMfpRrgiY2nTALOK',
'Vì giống được. Trong thay hơn người là đi đó nhiều.
Có cách người bạn điều giữa đó.
Mỗi với đúng đi. Có gần cái cái làm không. Thay tôi như dưới người cách nếu chưa.',
'Ông Dũng Bùi',
'user42',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71fa-7ddf-8abb-bc8907edc72e',
'2026-05-21 07:55:15',
'2026-05-21 07:55:15',
'https://drive.google.com/uc?id=1uZBtbMW9Rcxtx4GRMA-tdf9F_Mt-SxYE',
'Với được tôi dưới.
Nhưng vì để được cũng. Đã như theo tôi chưa được đúng. Khi đúng bên cho với rất. Và cũng nhiều dưới vậy tôi khiến vậy.',
'Bảo Mai Bảo Phạm',
'user43',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71fb-7521-ae78-322c73f35ced',
'2025-12-17 07:55:15',
'2025-12-17 07:55:15',
'https://drive.google.com/uc?id=1za3w9eyIAGxROxLp2XDftTI0HY8cak2T',
'Giữa giữa tại vài đi. Là thì như làm đã làm mà nếu. Từ nhiều tự. Đang trong thì lớn này.
Như để hơn nơi để cũng đang. Không đang khiến.',
'Vi Mai',
'user44',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71fc-72cc-8418-fdd7996020ba',
'2025-12-26 07:55:15',
'2025-12-26 07:55:15',
'https://drive.google.com/uc?id=1xqzRMg9F3c3ZPZDHGKNzPpoEFtg45wCk',
'Hoặc của cũng thế nhiều của số. Tại đó không theo một giữa đó.
Để với mỗi cũng về cũng cũng làm. Đang nhưng từng.
Từ trong người mà chỉ đi sẽ. Trong vài chỉ để. Nếu sẽ đó lớn.',
'Bà Chi Bùi',
'user45',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71fd-7a87-a560-ed59adfd1292',
'2026-02-03 07:55:15',
'2026-02-03 07:55:15',
'https://drive.google.com/uc?id=1q8qdf2mAh6x0ZBy9qTrQMSBbFnnQd4xs',
'Số người thay tại người có. Mỗi cái như tại. Tại dưới rất về đang vậy.
Nhưng bạn vẫn. Của và đó đúng sẽ với. Hơn sẽ như của người.
Vẫn một hoặc đúng. Cách hoặc nào chưa chưa tại.',
'Khoa Vũ',
'user46',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71fe-7581-8d57-54934d5db3e1',
'2025-10-13 07:55:15',
'2025-10-13 07:55:15',
'https://drive.google.com/uc?id=1sLo1qqyTfdl2L5bnWtpnc8yaFZJO1-VH',
'Như đó không như vài tự có cho. Vẫn của số như đã. Nào hoặc có.
Của rất vài này mỗi mà.
Giữa vài với làm thế. Và được đi của về.
Đến đúng thay. Số đi trong có. Tôi dưới rất điều.',
'Nhật Bảo Phạm',
'user47',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-71ff-7f89-b53c-c98c8c8b7025',
'2025-07-29 07:55:15',
'2025-07-29 07:55:15',
'https://drive.google.com/uc?id=1NRtMLxSTIYBtbjUwF33ml3-aX9byktlQ',
'Mà không đang. Trong đang này số vẫn nào hơn.
Của điều tại để hoặc thế từ. Lớn này cách.
Với với nhưng. Của như về từng với như cho sau.
Của như các đang của từ đi từng. Cũng từ cũng.',
'Quang Trần',
'user48',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7200-7d0d-839a-9b001a052932',
'2025-07-15 07:55:15',
'2025-07-15 07:55:15',
'https://drive.google.com/uc?id=1C3BQ8UlnN-DVXk0H6A5I6__6aIlG0aKV',
'Điều giữa đúng nếu của của sẽ. Số đúng như.
Như từ giống cũng. Vì cho mà gần như hơn vài.
Cách lớn hơn cũng như. Có từ của. Gần đến khiến giống hơn tại với. Đã nếu như tại này của từ.',
'Chị Thảo Hoàng',
'user49',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7201-7c03-b188-48a65da29124',
'2025-06-20 07:55:15',
'2025-06-20 07:55:15',
'https://drive.google.com/uc?id=1K1Isrz_AR93VFlBWnjgMxFVKoScn1T8B',
'Điều đó như cho từng hơn. Đi tự tự người. Giống để nếu cũng vậy. Để để như mỗi cũng hoặc đang.
Vậy để làm thì. Người để được và của đến sẽ lớn. Trong thế không.',
'Xuân Phạm',
'user50',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7202-79a4-97c8-815296b9a663',
'2025-12-08 07:55:15',
'2025-12-08 07:55:15',
'https://drive.google.com/uc?id=1Z1kiaBFkWoLXEPLvddgMh11NJOUMmyhO',
'Này rất sau làm thì cũng. Như cái của với mà vậy.
Nhiều để các tại. Sau bạn trong bạn nhưng. Có thế thế trong với về.',
'Tùng Mai',
'user51',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7203-7be8-9d42-355670e1c490',
'2025-09-25 07:55:15',
'2025-09-25 07:55:15',
'https://drive.google.com/uc?id=1BA7zQgOeUgCPPVii86miaKoFHRHHiX4q',
'Mỗi có của. Của cũng trong cái tự giữa như.
Khiến để từng bên. Đúng đó nào không lớn bạn. Này không vậy giữa.
Là từng từ thì. Gần cho này nào trong. Để khiến trong như nào có.',
'Bảo Trần',
'user52',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7204-77c8-8be0-7e812b0b9d83',
'2025-10-07 07:55:15',
'2025-10-07 07:55:15',
'https://drive.google.com/uc?id=1CK3PxJF7EsFOjvfKwTx5XdddQ7HRETz2',
'Để và sẽ từ đã vài. Nhưng rất có mỗi. Cái dưới để nào.
Của theo cái để. Tự của khi cái về.
Cách bạn bên cho sẽ tại. Gần tự nào các.
Thay mỗi trong từ nhưng. Của không của tự về.',
'Ông Hoàng Lê',
'user53',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7205-7766-9119-099a9e31dbde',
'2025-10-07 07:55:15',
'2025-10-07 07:55:15',
'https://drive.google.com/uc?id=1rhat0mee7603ol2LjQsMKauyNFkDgTUR',
'Đến cách các đang một. Thay giữa cái vậy vậy số là của. Như đi nhiều đang sau.
Dưới về từ trong vẫn giữa sẽ. Có đang được cho nhưng.
Từ theo gần bạn. Bên mỗi điều về thay cái để.',
'Phương Trí Hoàng',
'user54',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7206-71b6-811e-0b516a2486c3',
'2025-06-10 07:55:15',
'2025-06-10 07:55:15',
'https://drive.google.com/uc?id=1A8JxpYc7Cg3f3I_RK2E_001UahK0f-lG',
'Sau đang cho bên cách tại.
Một khi bạn trong người. Chưa thế để điều của.
Nhưng đó như đang.
Về của giữa chưa có được. Dưới được vậy như trong thế.',
'Nhật Dương',
'user55',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7207-7ac6-8ebf-877229f39d6a',
'2026-02-01 07:55:15',
'2026-02-01 07:55:15',
'https://drive.google.com/uc?id=1OLJ-fg4eBKCZhNmp-zvKeIL5DaCBF_3-',
'Hơn vì và nhiều nơi nào về. Giữa chỉ làm của. Như hơn cũng số.
Vì đến theo tại dưới nếu cũng. Làm tôi hơn trong với vài.
Cũng khiến của. Này hơn làm người nào bên. Giữa được như vài.',
'Anh Dương',
'user56',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7208-7f08-bf81-1e1372da730f',
'2025-09-02 07:55:15',
'2025-09-02 07:55:15',
'https://drive.google.com/uc?id=1qF1OWITvAmAM67lPN1q8BOUdl4wvbsQu',
'Theo thay mà để hơn vì với. Cũng mà theo như bên rất.
Tự mà tự gần nơi từ. Thì thế nơi tại đang. Về số một trong một. Cách nhưng các tôi bên nhưng.
Đi của nhưng bên. Cho bên để cho làm bên cũng.',
'Ông Hoàng Hoàng',
'user57',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7209-7602-9a34-173e30dedcab',
'2025-09-21 07:55:15',
'2025-09-21 07:55:15',
'https://drive.google.com/uc?id=1vIVPVcDXojXX_vKA9fGIeP6NSdGQy7c7',
'Vậy như cho. Thay lớn người như đã.
Dưới bạn chưa vẫn. Lớn từng có nhiều tự.
Của của như có điều như. Tự lớn tại lớn.
Nào tôi cho dưới làm và đến. Hơn đang bên.',
'Xuân Vũ',
'user58',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720a-722d-8220-62d9e081e134',
'2026-02-24 07:55:15',
'2026-02-24 07:55:15',
'https://drive.google.com/uc?id=1Cdb5ZHiKnjVftqN4XVEOl8eDuA1FbG8F',
'Tại tại dưới đã thế sau. Được cách các từ. Khiến của giữa với khi.
Trong làm chỉ vài. Thay của vẫn theo.
Cái nếu trong thì có người với. Vậy sau có từ như vì rất.
Nhiều với điều gần cho sẽ không.',
'Chi Đặng',
'user59',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720b-7da5-b7a1-fd44b50d3b7d',
'2025-06-18 07:55:15',
'2025-06-18 07:55:15',
'https://drive.google.com/uc?id=1tSfLJdmxnW87TxGatLb65JT-UEYoXmrg',
'Là cái có giữa.
Đến thế bạn nơi được chưa không từ. Số đã gần đang. Tại rất thế như đúng. Hơn hơn thì đi.
Trong có hoặc. Để giữa cách như. Trong thế nơi cái làm.',
'Hoàng Mai Lê',
'user60',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720c-7464-b6c1-7dcc80923643',
'2026-04-08 07:55:15',
'2026-04-08 07:55:15',
'https://drive.google.com/uc?id=1Bqukzz4E1Cepizkj7eS4dve2BVFs7_zm',
'Thì gần theo hơn. Vậy cách lớn chỉ chưa. Điều về làm thế.
Thì vậy một để. Vài theo giữa. Từ khiến không nhưng với sau để. Giống một khiến có hơn.
Hơn bạn bạn là trong. Cũng từ số bên không.',
'Lâm Vũ',
'user61',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720d-747b-8c72-d117997cb319',
'2025-12-27 07:55:15',
'2025-12-27 07:55:15',
'https://drive.google.com/uc?id=1Xkc1oL0FTKSB_eK2z00Ty4GVwDbGIh5v',
'Đó để tôi nào thế đang.
Theo khi cách không giống. Hơn chưa để chỉ không một đến. Các hơn sẽ sẽ về như.
Từng được nơi khi nếu lớn làm. Trong là các.',
'Cô Hương Phạm',
'user62',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720e-7058-9e7e-8e12ad852c7c',
'2025-08-31 07:55:15',
'2025-08-31 07:55:15',
'https://drive.google.com/uc?id=1ENLf-Ro4KI8kXuboIHYPpM8XuS3C6vvX',
'Để của như để sẽ nếu hơn. Nhiều thay các mà. Bên cách để dưới.
Số của của. Về không mà tôi vậy sẽ sau có. Tại để số có.
Vậy để nhưng mà giống cũng. Từ nhưng không cũng thế. Tôi tự như cách.',
'Hưng Xuân Hoàng',
'user63',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-720f-7a4a-8d89-89cc39536c64',
'2025-06-16 07:55:15',
'2025-06-16 07:55:15',
'https://drive.google.com/uc?id=100jbTy-mOsQ-VuZxT6mob4Z1esOCCJcw',
'Thế với cái chỉ khiến một và. Như hoặc để được có. Để làm nào thì nhiều đi.
Của rất hoặc. Đúng vì tự người tự như. Đúng tự nhưng không số từng.',
'Nhật Tấn Nguyễn',
'user64',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7210-7b0f-9891-93ee2715cdf1',
'2025-07-01 07:55:15',
'2025-07-01 07:55:15',
'https://drive.google.com/uc?id=1JoVtciQ2CVbsGojTuBjEFFhFZZC44UbA',
'Một với như mỗi đến cũng nhưng.
Nào với nếu cũng thay trong nhiều. Rất tại từ dưới hoặc. Về chưa chỉ.
Và không là. Mà sau đi với chỉ có.',
'Minh Trần',
'user65',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7211-7d7c-998d-adf0bf978de7',
'2025-07-08 07:55:15',
'2025-07-08 07:55:15',
'https://drive.google.com/uc?id=1UMbPgUoANcH2Dr3befTctc5EQX8bXeR1',
'Nào tại đang chưa. Của từ mỗi giữa của. Vẫn cũng sau từ trong.
Cái rất đó lớn. Điều là với được.
Có khiến người có số nếu cũng. Có với vì tại như. Hoặc tôi từ các là đó.',
'Bà Linh Đặng',
'user66',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7212-725c-a310-bca74fc22932',
'2025-12-01 07:55:15',
'2025-12-01 07:55:15',
'https://drive.google.com/uc?id=1f-CT4Kww4bD7tf4QGMSImEwYYDjwL8EU',
'Nơi tự đó với của đến.
Đến về với như số theo. Về khi theo bên đến của hoặc.
Cách của đúng trong như từng.
Để cho rất đến cái. Từng vẫn hoặc với dưới trong cho.',
'Kim Trí Nguyễn',
'user67',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7213-71dd-91ee-1af48d90c857',
'2026-04-04 07:55:15',
'2026-04-04 07:55:15',
'https://drive.google.com/uc?id=11Mbpd-Qj7GlcU35aZsJo0QLmFDShP5q0',
'Như người rất bên gần. Gần để khiến. Số như với làm hơn hơn.
Chưa vài đúng nào sẽ chưa. Này tại từ tôi vẫn. Tôi được có sau theo của vài.',
'Quang Dương',
'user68',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7214-7f2d-b59d-cc7da6e87ea2',
'2026-01-21 07:55:15',
'2026-01-21 07:55:15',
'https://drive.google.com/uc?id=1-rEg0GPK-nFbnaeaQAVwfkEDMqjAtBT5',
'Vì nhiều dưới người cũng đúng. Để và được. Với số cái hơn về.
Nhưng chỉ hoặc các. Có giữa không hoặc dưới để này.
Vì mà như. Được hoặc gần như từ.',
'Vũ Quang Vũ',
'user69',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7215-706b-809f-6ec2e1658678',
'2025-06-11 07:55:15',
'2025-06-11 07:55:15',
'https://drive.google.com/uc?id=1i2FKBrrxKSMgDVIrkQ_t-Y-9QWe_5YN_',
'Với để có cái của theo. Vì về với từng hơn lớn khi. Mỗi như tại để chỉ.
Nếu được nếu của hơn lớn. Nào với đến.
Của cũng từng thay có.',
'Hà Trí Vũ',
'user70',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7216-7fc2-9d38-a8a11f2962dc',
'2025-12-14 07:55:15',
'2025-12-14 07:55:15',
'https://drive.google.com/uc?id=1XvJAzXk9oDHcjp3fRtX_7P-aFRnk-S2E',
'Dưới như đi trong. Không của có đi. Bên khi hơn như rất chỉ hơn.
Thay và để hơn bên. Đến để không được vì để.
Thế điều tôi cho. Cũng như không người.',
'Bác Châu Dương',
'user71',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7217-7106-9ea1-ab200e2c6ec2',
'2026-01-26 07:55:15',
'2026-01-26 07:55:15',
'https://drive.google.com/uc?id=1e_gXh9TdcXlQYAEhgpDqoIWIvKNBW1w0',
'Mà nơi cũng dưới tự để có tôi. Như để giữa nếu. Số đang đến theo gần của của.
Đi nơi không số với.
Giống cũng nếu đó. Bên như và chỉ để.
Cách hoặc cũng như. Thì cho như.',
'Cô Khoa Trần',
'user72',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7218-7a02-bbdf-305d1f1c7b3c',
'2026-02-09 07:55:15',
'2026-02-09 07:55:15',
'https://drive.google.com/uc?id=14snT_FsPtRNAYj3jeMLWdVC6KdKwTR_a',
'Của tại nhiều như nhưng sẽ như. Nhưng để thế cũng giống hơn.
Không cho gần để. Số về trong cái giống. Không thế nhưng từ cái điều mỗi.
Từ như và để bên như. Số với dưới trong nhiều.',
'Bà Nhật Hoàng',
'user73',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7219-797f-930d-dee6b3327aa1',
'2026-03-07 07:55:15',
'2026-03-07 07:55:15',
'https://drive.google.com/uc?id=1Jzui2_KsCRci6o_CLkcsSOZaClnG7glj',
'Để lớn giống bạn một người.
Làm vài thì. Cũng làm mỗi đó này mà. Lớn đến gần mỗi mỗi nhưng theo.
Làm để đúng mà với khiến. Từng theo với bên nào đi tại.',
'Mai Trần',
'user74',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721a-7bae-b953-05be29912692',
'2026-05-09 07:55:15',
'2026-05-09 07:55:15',
'https://drive.google.com/uc?id=1ayD3tlDPGtHgk4X3IIi97va6Zs2cAPqE',
'Đang nơi vẫn về giữa. Vậy theo và như giống.
Thế của nơi. Thế nhưng đó tôi cái thế giống.
Nếu tại đến trong đã trong của. Với vì tại.
Có khiến của vì này. Có điều tôi thế để đi hoặc.',
'Thành Lê',
'user75',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721b-76eb-b045-f2c4681c6314',
'2026-04-28 07:55:15',
'2026-04-28 07:55:15',
'https://drive.google.com/uc?id=15vSqC7QA9gB8PTCZeiK5tBS4nwwV7iX7',
'Hơn sẽ điều tôi. Chỉ chưa như một trong. Cũng rất hoặc bên trong lớn nơi là.
Mỗi về làm. Tại tự thay giống bên thì từng.',
'Chị Chi Lê',
'user76',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721c-73c0-9340-7a9f9ba29730',
'2026-01-16 07:55:15',
'2026-01-16 07:55:15',
'https://drive.google.com/uc?id=1U6Ehe3Ur5t0eVQfesNFGHh9_PZ9SKxpM',
'Nơi khi từ tự vậy rất khi. Khiến điều như vì trong.
Gần đó bạn cũng thế. Rất gần nơi số nào bạn như. Vậy để nhưng số để.
Trong nhiều của cái với sẽ. Không để là như từng. Bên hơn có người thế lớn.',
'Trọng Bảo Mai',
'user77',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721d-72db-b29d-a50e8904d6aa',
'2025-09-20 07:55:15',
'2025-09-20 07:55:15',
'https://drive.google.com/uc?id=1Lnf_yjbA8KCoHLVT7RDXl0cWT-1JMcfn',
'Vậy để gần theo điều của số. Từng nơi trong bạn tôi vài.
Cách bạn mà sẽ. Tại bên đã hơn. Chưa thế nào tại.
Vẫn điều là như có. Người nào khiến. Các đi hơn như.',
'Vân Phạm',
'user78',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721e-7457-b6b1-297fa29634f0',
'2025-07-13 07:55:15',
'2025-07-13 07:55:15',
'https://drive.google.com/uc?id=1PoDTY6eQd2L_hvxz8-FLL7PJcjgYHrMT',
'Làm từ các được bạn là tại. Tôi nếu từng nếu như trong. Không chỉ cái người số. Cũng mà sẽ hơn từ có hơn vẫn.
Rất bên tôi sẽ cái như từ. Dưới cũng từ vì. Chỉ khi từng như nơi.',
'Bà Nhật Mai',
'user79',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-721f-7cb0-acb2-8ad6d7a7c85f',
'2026-04-14 07:55:15',
'2026-04-14 07:55:15',
'https://drive.google.com/uc?id=1XA4t2KtUpvdRGt9A38cN4qZ4fPNwXyOw',
'Thì đi này. Cũng vài hơn.
Vậy rất đã theo đang đi đang.
Tại từ mà cũng hơn. Khi khiến dưới chỉ bạn để như.
Gần tại bạn làm tự. Cũng chỉ như làm và tại.',
'Bà Hạnh Mai',
'user80',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7220-7480-9d88-eff78ded1e54',
'2025-09-30 07:55:15',
'2025-09-30 07:55:15',
'https://drive.google.com/uc?id=1qwa1pWcJt1SKF9O4dTNBBc2atviC7EAu',
'Mà của đi như gần vài mà tại. Của cho từ hơn sẽ là.
Mà cái hơn sẽ nơi số nếu. Giống đó chỉ làm. Khi nào từng thì.
Khi không đến không. Mỗi với như vẫn đang sẽ.
Được tự đang. Rất dưới thì thì của với.',
'Quý cô Mai Hoàng',
'user81',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7221-7fdc-ba3d-b68aadb31db2',
'2025-10-21 07:55:15',
'2025-10-21 07:55:15',
'https://drive.google.com/uc?id=13n9aRfo1pqP2xQNU698SSEPfPpc5iZbn',
'Được lớn các giống vậy dưới. Thế bên từng nơi đó vẫn. Tự như chưa như bạn thế tôi.
Với nhiều từ với. Đó hơn dưới thế. Như đó hơn và vài từ.',
'Bà An Phạm',
'user82',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7222-7fc6-af44-9658cbd3fe1c',
'2025-07-03 07:55:15',
'2025-07-03 07:55:15',
'https://drive.google.com/uc?id=1q44Wg_GFyhl6jAzkIvN8pefPtfdEgnGv',
'Lớn sau đã từ khiến của đúng của. Với vẫn từng để thì đi không vẫn.
Để từng lớn nào đang theo để chưa. Đang của thế là thay của hơn. Số điều nếu không gần.',
'Chị Bảo Trần',
'user83',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7223-78d4-8a08-a8150f6b17bb',
'2025-07-31 07:55:15',
'2025-07-31 07:55:15',
'https://drive.google.com/uc?id=1pFPbCrgWUKzZY2DVVkfDky8B4ifzITWj',
'Đúng giống cũng nhưng.
Từ bạn như các tự. Sẽ từ đi của sau. Rất không giữa của nhưng cái hơn.
Vậy hơn từ như. Từ mỗi cho làm hoặc cái bạn và. Bên sẽ vẫn.',
'Hải Trần',
'user84',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7224-775b-979b-9958ac2b8b8b',
'2026-02-11 07:55:15',
'2026-02-11 07:55:15',
'https://drive.google.com/uc?id=1ZIdyQIZ9GYNEIn_qri_Dvj7cxdzNt_R3',
'Tại đang của và. Gần sẽ là này không trong.
Thì có đó thay theo để đã. Hơn khi như bên của.
Tự cũng được của với đúng có là. Như như đúng để nhưng của hoặc khiến. Từ thế cũng dưới.',
'Anh Châu Phạm',
'user85',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7225-7884-b4fd-2a6afb8a7b76',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'https://drive.google.com/uc?id=1QOwFbANvVHGq6_O8Djk6DVcKrDFNqelO',
'Sau mỗi chỉ tôi để nơi lớn. Trong hơn từ đã đã hoặc thay thay. Với như đúng tự. Từ của như.
Mà như mỗi cũng. Tôi cho vì tại.
Như đúng chưa. Như vì của lớn tôi này. Trong sau để thế số thì sẽ.',
'Linh Nguyễn',
'user86',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7226-7936-a82d-a73f55a768b8',
'2025-11-06 07:55:15',
'2025-11-06 07:55:15',
'https://drive.google.com/uc?id=1KEfThp7VORNdqxN1qnwgvYnk7DAir9Zv',
'Đi đã đang đến và khiến nào từ. Khiến hoặc gần chưa.
Thế thì với hoặc như của. Để của làm lớn người tự.
Vì đó của với sẽ của là. Đến nếu khi hoặc vài. Bên tôi từ hoặc.',
'Cô Hạnh Nguyễn',
'user87',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7227-7bac-be6c-7ed468a3634b',
'2025-09-10 07:55:15',
'2025-09-10 07:55:15',
'https://drive.google.com/uc?id=1faD7er4Gw8Nyj6IXadZ8P6L_p_3B5QoD',
'Gần số thế của giống. Hơn vì của đó. Vậy nhưng có nếu thì hoặc đó dưới.
Gần các đúng như làm làm. Giữa làm lớn làm để trong vẫn. Đang và thay khiến lớn như.',
'Cô An Trần',
'user88',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7228-7ff6-8260-14f843b426b5',
'2025-10-29 07:55:15',
'2025-10-29 07:55:15',
'https://drive.google.com/uc?id=1T44q0Q3wg0-CR6HY5Z-qB4xWBqyw13Vv',
'Như cái sẽ khi cũng. Vài tại lớn từ từ dưới.
Người và để rất. Hơn mỗi để cũng giữa trong có.
Từ theo hoặc. Đúng không đó nào giữa nào.',
'Hà Đức Dương',
'user89',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7229-74cf-827f-790a3410b202',
'2026-01-17 07:55:15',
'2026-01-17 07:55:15',
'https://drive.google.com/uc?id=105mbm0ZV6xao5suvoQZLo0AoGSehI-Sz',
'Tôi người cái nếu. Chưa gần để nhưng với hơn nơi.
Hơn thay hơn của. Giống hơn vậy có với vài để. Với với đến.
Cái và tự nhưng khiến vậy làm. Số đang sau vẫn đã rất.',
'Phương Phạm',
'user90',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722a-7d88-a522-5ab60ce4ede1',
'2026-03-07 07:55:15',
'2026-03-07 07:55:15',
'https://drive.google.com/uc?id=1ccGe2sG5FtMe6dGzdTtbz0DG-j4n_Ww-',
'Đang lớn thì điều để. Làm trong cũng không nếu.
Bạn của sau bên. Không là cách vậy khi đó.
Cách khi đó giữa vài được hơn. Chưa không về nhưng có theo. Hoặc sau mỗi vậy trong đó.',
'Ngọc Mai',
'user91',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722b-7019-b2f7-2f225bdbde7b',
'2025-06-20 07:55:15',
'2025-06-20 07:55:15',
'https://drive.google.com/uc?id=1EWjv9zURwAEEhisM8a3LxbL1OUhE-lpO',
'Từng cho từ làm để cũng. Cách gần thì đó tự vì nào. Hơn như như về các bạn trong.
Mà cái sau vậy trong. Số sẽ người của vài đang để theo.
Cái hoặc làm đi điều. Dưới chưa với tại một trong khi.',
'Xuân Mai',
'user92',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722c-75ff-a174-3f35d44ba863',
'2025-06-03 07:55:15',
'2025-06-03 07:55:15',
'https://drive.google.com/uc?id=11Z__sBgUfpRuccuwcBvMIZWFPSWJQgaM',
'Chưa khiến đã không. Cũng về sau chưa. Về là có cũng này.
Hoặc đúng vậy sau một. Bạn đi dưới thì với của khiến.
Lớn vài sẽ vẫn từ. Đi bên sau vài hơn theo. Đó vẫn từ của đã về.',
'Chị Hà Bùi',
'user93',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722d-7949-be88-2e32d168015c',
'2026-05-19 07:55:15',
'2026-05-19 07:55:15',
'https://drive.google.com/uc?id=1mQCwUqWAn9rccMQzmz4hHJBKcujmwNWb',
'Đúng đang của thì khi. Cũng thế tự chưa của.
Làm khiến tôi như của sẽ từng. Đã của một chỉ đến tại. Hoặc nơi cũng không vậy thay.
Từ nhiều có cái đó này tự. Là nhiều bên như.',
'Nhật Nguyễn',
'user94',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722e-799b-b91a-6c9e67908a78',
'2026-03-28 07:55:15',
'2026-03-28 07:55:15',
'https://drive.google.com/uc?id=1M4qthKyBdwZBxmeH_Q06reNcm9wa7qsl',
'Trong thay để dưới nơi. Nơi cho với khi và hoặc rất.
Lớn của tại đang điều. Để tự cách và các của. Trong sau để thay.',
'Thành Trí Đặng',
'user95',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-722f-7b21-aa96-965ad24446a6',
'2025-10-16 07:55:15',
'2025-10-16 07:55:15',
'https://drive.google.com/uc?id=1_J_it9VBgZTxi2jS3q0vIOtXxakASbdx',
'Để vài với chỉ được có. Vài hơn điều đã đến.
Không nơi cách. Theo hoặc như về như. Cái trong với được người sẽ.
Thay thay tôi. Hoặc thì như và nào cũng trong. Tại nơi điều chỉ cái hoặc.',
'Anh Huy Bùi',
'user96',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7230-7a1b-aeee-8a5c1c2f0aa0',
'2026-01-29 07:55:15',
'2026-01-29 07:55:15',
'https://drive.google.com/uc?id=15gkMkYPRDk2s4tKhgv4XtBs3Rma9ONvi',
'Không và từ khi của điều tại. Rất chưa số không cái. Để một để đi với. Cũng chỉ có đến nào của sẽ.
Trong cho đúng thay để. Và đến mà đến vậy.
Người khi cái đúng chỉ người sẽ. Nơi gần làm chưa sau.',
'Anh Trung Hoàng',
'user97',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7231-735c-97f1-99bcc04a6d9b',
'2026-02-20 07:55:15',
'2026-02-20 07:55:15',
'https://drive.google.com/uc?id=1mrCZZXcWpodLroJA2BVyOWjJQP90nnv-',
'Thay cái cho. Bạn giữa khiến cách trong.
Với nào hơn sẽ về. Khiến của cái sau khi theo để. Người giữa hoặc cho. Bên hoặc từ mà.
Chỉ điều với rất mỗi nếu. Gần là có tự không. Tại nơi các khi.',
'Thành Mai',
'user98',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7232-77ad-ae57-8244364a8b80',
'2025-05-30 07:55:15',
'2025-05-30 07:55:15',
'https://drive.google.com/uc?id=19s6y6xVTupSrR5Q6Zz23M91AXxZECUhv',
'Có của đó tại.
Có với bạn là thay và các khiến. Mà với thay điều.
Với chưa người. Nhưng vài như đã tại.',
'An Đặng',
'user99',
'0',
'0'
);


INSERT INTO profiles (
user_id, created_at, updated_at,
avatar_url, bio, display_name, username, follower_count, following_count
)
VALUES (
'019e4eae-7233-78e6-b42c-a37fd000de67',
'2025-08-29 07:55:15',
'2025-08-29 07:55:15',
'https://drive.google.com/uc?id=1IoB7EHzZcMopth4NUO5CFiwaNMYimqrz',
'Như như không với. Cho vì điều thay đúng. Có dưới tại đó đến thì.
Đến của đi rất như.
Cho nào gần. Vậy theo của dưới.
Theo dưới vài về. Vì nếu tại khiến được để có.',
'Trung Phú Hoàng',
'user100',
'0',
'0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d0-7f6a-aa43-53651a991342',
'019e4eae-717d-71eb-a1e3-a8bff1a7b848'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d1-76ab-bfa0-5c6b67b717b5',
'019e4eae-717d-71eb-a1e3-a8bff1a7b848'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d2-7b79-b12a-03e3c7e17d17',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d3-730b-afc4-210c7f94f3b9',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d4-7424-bc50-0e6ff1d623e1',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d5-7e4f-a373-cf185fb7489e',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d6-7792-aec4-6c40cfd028f4',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d7-752a-9af2-32b1a001f047',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d8-79e8-84f6-483c2c830f6f',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71d9-7d2c-a73d-5cf4f8df974d',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71da-7553-9436-32c988b9def4',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71db-7af1-bfe1-b2249485ff0a',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71dc-759c-9320-5fdfc6e2a4e8',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71dd-7dea-808b-e2c2f1659ebb',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71de-727a-a090-454f367cf2e7',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71df-7a78-afdc-2976b44fc7df',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e0-7c13-a5ce-53b4f021d265',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e1-7d0c-84d3-e24faba96c12',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e2-7f4e-a0f9-c08845a81638',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e3-7d01-b22b-b381394bde7b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e4-728b-80fc-9943d8b4d98d',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e5-77c8-b621-94c486d65adf',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e6-7e46-8f59-a3ca647b9ebd',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e7-7d01-87ca-b62bd8cb4789',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e8-78f4-a0eb-581446087c9b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71e9-7262-b21f-f080d0377e5f',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ea-7435-8246-5d65a243d586',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71eb-70cd-a046-c53afbde2c8b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ec-7341-a302-e66504f69a27',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ed-7df9-99c9-91624f6bc58e',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ee-7cb2-b296-83bb36bfea88',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ef-7a81-b8aa-c6b6da5da6e9',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f0-7a7c-aebe-d78d942756ce',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f1-74b3-8982-188df55858f6',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f2-78df-bab9-1564272cceb8',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f3-74b6-b03d-30906bd80322',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f4-7776-af2f-ec029765d16d',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f5-75ef-aa50-8c0e17daec19',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f6-7540-98e8-337af35da210',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f7-7dd3-9b29-8f8745327e74',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f8-725f-b7e3-a0a4a7e0b98a',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71f9-700d-88d9-5de301a01b9f',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71fa-7ddf-8abb-bc8907edc72e',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71fb-7521-ae78-322c73f35ced',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71fc-72cc-8418-fdd7996020ba',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71fd-7a87-a560-ed59adfd1292',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71fe-7581-8d57-54934d5db3e1',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-71ff-7f89-b53c-c98c8c8b7025',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7200-7d0d-839a-9b001a052932',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7201-7c03-b188-48a65da29124',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7202-79a4-97c8-815296b9a663',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7203-7be8-9d42-355670e1c490',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7204-77c8-8be0-7e812b0b9d83',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7205-7766-9119-099a9e31dbde',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7206-71b6-811e-0b516a2486c3',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7207-7ac6-8ebf-877229f39d6a',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7208-7f08-bf81-1e1372da730f',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7209-7602-9a34-173e30dedcab',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720a-722d-8220-62d9e081e134',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720b-7da5-b7a1-fd44b50d3b7d',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720c-7464-b6c1-7dcc80923643',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720d-747b-8c72-d117997cb319',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720e-7058-9e7e-8e12ad852c7c',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-720f-7a4a-8d89-89cc39536c64',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7210-7b0f-9891-93ee2715cdf1',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7211-7d7c-998d-adf0bf978de7',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7212-725c-a310-bca74fc22932',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7213-71dd-91ee-1af48d90c857',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7214-7f2d-b59d-cc7da6e87ea2',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7215-706b-809f-6ec2e1658678',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7216-7fc2-9d38-a8a11f2962dc',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7217-7106-9ea1-ab200e2c6ec2',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7218-7a02-bbdf-305d1f1c7b3c',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7219-797f-930d-dee6b3327aa1',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721a-7bae-b953-05be29912692',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721b-76eb-b045-f2c4681c6314',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721c-73c0-9340-7a9f9ba29730',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721d-72db-b29d-a50e8904d6aa',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721e-7457-b6b1-297fa29634f0',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-721f-7cb0-acb2-8ad6d7a7c85f',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7220-7480-9d88-eff78ded1e54',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7221-7fdc-ba3d-b68aadb31db2',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7222-7fc6-af44-9658cbd3fe1c',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7223-78d4-8a08-a8150f6b17bb',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7224-775b-979b-9958ac2b8b8b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7225-7884-b4fd-2a6afb8a7b76',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7226-7936-a82d-a73f55a768b8',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7227-7bac-be6c-7ed468a3634b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7228-7ff6-8260-14f843b426b5',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7229-74cf-827f-790a3410b202',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722a-7d88-a522-5ab60ce4ede1',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722b-7019-b2f7-2f225bdbde7b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722c-75ff-a174-3f35d44ba863',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722d-7949-be88-2e32d168015c',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722e-799b-b91a-6c9e67908a78',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-722f-7b21-aa96-965ad24446a6',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7230-7a1b-aeee-8a5c1c2f0aa0',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7231-735c-97f1-99bcc04a6d9b',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7232-77ad-ae57-8244364a8b80',
'019e4eae-717e-7756-9994-aa00625da2a0'
);


INSERT INTO user_roles (user_id, role_id)
VALUES (
'019e4eae-7233-78e6-b42c-a37fd000de67',
'019e4eae-717e-7756-9994-aa00625da2a0'
);

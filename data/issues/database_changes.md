# 数据库更改记录

> 2017/7/7

- tp_hall 增加 纪念馆访问量（view）字段
- tp_hall_style 增加 纪念馆风格大图（style_big_img）字段

> 2017/7/8

- tp_hall 纪念馆类型字段 hall_type 类型补全：纪念馆类型 1个人馆 2双人馆 3家族馆 4事件馆 5主题馆 6名人馆 
          注：1、6 是单人馆（single）； 2、3、4、5 是多人馆（yuan） 
              1、2、3 是普通馆（putong） 任何用户都可选择添加，主题皮肤固定选择
              4、5、6 是高级馆（gexing） 只有管理员后台可添加，主题皮肤可定制开发

- tp_hall 增加 皮肤目录（skin_dir）、纪念馆风格皮肤类型（skin_type）、纪念馆皮肤类型（skin_hall_type）字段

> 2017/7/12

- tp_hall 将名人纪念馆类型（is_celebrity）字段改成 famous_type 默认为0 表示不属于名人纪念馆
- tp_hall_famous_type 将名人纪念馆类型表（tp_hall_celebrity_type） 改成 tp_hall_famous_type

> 2017/7/13

- 新增 tp_hall_event（事件馆） tp_hall_theme（主题馆） 数据表
- tp_hall_style 新增纪念馆风格图片位置（style_position）字段 1中间 2右下角 默认1

> 2017/7/18

- tp_hall_group 表 删除managers members字段
- 新增 tp_hall_group_member（群成员）数据表

> 2017/7/19

- 新增tp_hall_surnames（百家姓）数据表



# 接口更改记录

> 2017/7/9

- HallStyleList =》 hallStyle 地址更改


    TRUNCATE tp_hall;
    TRUNCATE tp_hall_article;
    TRUNCATE tp_hall_event;
    TRUNCATE tp_hall_family;
    TRUNCATE tp_hall_follow;
    TRUNCATE tp_hall_group;
    TRUNCATE tp_hall_group_member;
    TRUNCATE tp_hall_leave_message;
    TRUNCATE tp_hall_one;
    TRUNCATE tp_hall_photo;
    TRUNCATE tp_hall_photo_picture;
    TRUNCATE tp_hall_theme;
    TRUNCATE tp_hall_two;
    TRUNCATE tp_mall_goods_package;
    TRUNCATE tp_mall_order;
    TRUNCATE tp_mall_order_goods;
    TRUNCATE tp_member_follow;
    TRUNCATE tp_member_worship;

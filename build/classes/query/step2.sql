insert into member values('881011kim','1234','�赿��','721012-1111111','1990/11/11','1','1','����','����','4��20ȣ��','2010/10/01',null,'d006','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','kimdong.jpg');
insert into member values('787871lee','1234','�̹�ȣ','721012-1111111','1990/11/11','1','1','�븮','���','4��20ȣ��','2010/10/01',null,'dg001','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','leemin.jpg');
insert into member values('17171park','1234','�ڹ���','721012-1111111','1990/11/11','1','1','�븮','���','4��20ȣ��','2010/10/01',null,'d0032','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','park.jpg');
insert into member values('9871kim','1234','�����','721012-1111111','1990/11/11','1','1','����','����','4��20ȣ��','2010/10/01',null,'d009','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','jjangkim.jpg');
insert into member values('lee0idjj','1234','����ȯ','721012-1111111','1990/11/11','1','1','����','����','4��20ȣ��','2010/10/01',null,'dg002','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','ansoccer.jpg');
insert into member values('djdiwjs','1234','������','721012-1111111','1990/11/11','1','1','���','���','4��20ȣ��','2010/10/01',null,'dg003','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','chasoccer.jpg');
insert into member values('282djdid','1234','������','721012-1111111','1990/11/11','1','1','�븮','��Ʈ��','4��20ȣ��','2010/10/01',null,'d001','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','parksoccer.jpg');
insert into member values('Yeona1231','1234','�迬��','721012-1111111','1990/11/11','1','1','�븮','��Ʈ��','4��20ȣ��','2010/10/01',null,'d003','����','222-222','����� ��õ��','��������','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','parksoccer.jpg');


create sequence purchase_seq;
create sequence purchase_detail_seq;

drop sequence purchase_seq;
drop sequence purchase_detail_seq;
drop table purchase
drop table purchase_detail

#�����Ϲ�
create table purchase(
	purchase_id varchar2(20) primary key,
	purchase_day date,
	request_id varchar2(15),
	request_dept varchar2(20),
	request_deptno varchar2(20),
	state char(1),
	type varchar2(15)
)

#���Ż�
create table purchase_detail(
    purchase_id varchar2(20),
	detail_num number,
	prd_code varchar2(15),
	prd_name varchar2(15),
	standard varchar2(15),
	count number,
	price number,
	supplyvalue number,
	vat number,
	totalprice number,
	clientcode varchar2(20)
)

insert into purchase values(to_char(sysdate,'yyyymmdd')|| purchase_seq.nextval, sysdate,'787871lee', '�濵��������','0','�系����');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_002','������','4*10',2,100000,200000,20000,220000,'code001');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_003','����','',20,5000,100000,10000,110000,'code010');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_010','Ź��','5*10',1,100000,100000,10000,110000,'code0002');


insert into purchase values(to_char(sysdate,'yyyymmdd')|| purchase_seq.nextval, sysdate,'Yeona1231', '������','0','���߿�');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_00i2','��Ʈ��','18��ġ',5,865000,4325000,432500,4757500,'com001');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_00i3','���ǽ�','ver2016',10,30000,300000,30000,330000,'soft010');
insert into purchase_detail values(to_char(sysdate,'yyyymmdd')||purchase_seq.currval,purchase_detail_seq.nextval,'prd_0i10','�渶�콺','11t',1,100000,100000,10000,110000,'pen0002');



select * from purchase;
select * from purchase_detail;

select rownum, p.*
from (select  * from purchase
	  where state ='0' 
      order by purchase_day desc) p
where rownum=1









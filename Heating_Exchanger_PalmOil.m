%% %% Calculating technical specification for heating exchanger type tube in tube: Capacity, height, diameter,...
clc
clear
disp('TINH SO BO THIET BI TRAO DOI NHIET ONG LONG ONG')
% Dong nong ben trong, dong lanh ben ngoai
%% Nhiet do
t_nv=90;%nhiet do dong nong vao
t_nr=60;%nhiet do dong nong ra
t_lv=30;%nhiet do dong lanh vao
t_lr=50;%nhiet do dong lanh ra
lamda_vach = 46.5;%W/m2
tt=0.1;%ton that
%% palm oil T(oC)  muy(mPa.s)  C(kJ/kg.K) W(w/m.K) d(kg/m3) 
t_dau = [ 20	25	30	35	40	45	50	55	60	65	70	75	80	85	90	95	100	105	110	115	120	130	135	140	145	150	155	160	165	170	175	180	185	190	195	200	205	210	215	220	225	230	240	245	250	255	260	275	280	285	290	295	300 ];
muy_dau = [ 106.8	77.19	57.85	44.68	35.41	28.68	23.68	19.88	16.93	14.61	12.75	11.23	9.99	8.955	8.087	7.351	6.721	6.179	5.709	5.298	4.937	4.335	4.083	3.857	3.653	3.469	3.302	3.151	3.012	2.885	2.769	2.662	2.563	2.471	2.387	2.308	2.234	2.166	2.102	2.042	1.986	1.933	1.836	1.792	1.751	1.711	1.674	1.572	1.542	1.513	1.485	1.459	1.434 ];
cp_dau = [ 1.848	1.861	1.875	1.888	1.902	1.916	1.93	1.944	1.959	1.973	1.988	2.003	2.018	2.034	2.049	2.065	2.081	2.097	2.113	2.129	2.146	2.179	2.197	2.214	2.231	2.249	2.267	2.284	2.303	2.321	2.339	2.358	2.377	2.396	2.415	2.434	2.454	2.473	2.493	2.513	2.533	2.554	2.595	2.616	2.637	2.658	2.68	2.745	2.767	2.789	2.812	2.834	2.857 ];
lamda_dau = [ 0.1726	0.1721	0.1717	0.1712	0.1708	0.1704	0.1699	0.1695	0.1691	0.1687	0.1683	0.1679	0.1675	0.1671	0.1668	0.1664	0.166	0.1657	0.1653	0.165	0.1646	0.164	0.1636	0.1633	0.163	0.1627	0.1624	0.1621	0.1618	0.1615	0.1613	0.131	0.1607	0.1605	0.1602	0.16	0.1597	0.1595	0.1693	0.1591	0.1589	0.1586	0.1582	0.1581	0.1579	0.1577	0.1575	0.157	0.1569	0.1568	0.1566	0.1565	0.1564 ];
ro_dau = [ 890.1	887.5	885	882.5	880	877.5	875.1	872.6	870.2	867.8	865.4	863.1	860.7	858.4	856.1	853.8	851.6	849.3	847.1	844.9	842.7	838.4	836.3	834.2	832.1	830	828	825.9	823.9	821.9	819.9	818	816.1	814.1	812.2	810.4	808.5	806.7	804.9	803.1	801.3	799.5	796.1	794.4	792.7	791	789.4	784.6	783	781.5	779.9	778.4	776.9 ];

%% Thong so ong
dk_trong=50*10^(-3);%m
bd_trong=2*10^(-3);%m
dk_ngoai=100*10^(-3);%m
bd_ngoai=2*10^(-3);%m
F_lvao = 33.33; %luu luong dong lanh (L/ph)
%% Delta T
delta_tmax = t_nv-t_lr;
delta_tmin = t_nr-t_lv;
delta_tlog = (delta_tmax-delta_tmin)/(2.3*(log10(delta_tmax/delta_tmin)));
ttb_nong =(t_nv + t_nr)/2; %nhiet do nuoc nong trung binh(oC)
ttb_lanh =(t_lv + t_lr)/2; %nhiet do nuoc lanh trung binh(oC)
%% Tim
ro_lanh=interp1(t_dau,ro_dau,ttb_lanh);
cp_lanh=interp1(t_dau,cp_dau,ttb_lanh);
muy_lanh=interp1(t_dau,muy_dau,ttb_lanh)*10^(-3);
lamda_lanh=interp1(t_dau,lamda_dau,ttb_lanh);
%% BANG TRA SO LIEU CUA NUOC
%% -----------RO-----------------------
t_ro1=[30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50];
ro1=[995.68 995.37 995.06 994.73 994.4 994.06 993.71 993.36 993 992.63 992.25 991.87 991.47 991.07 990.66 990.25 989.82 989.4 988.96 988.52 988.07]; 
t_ro2=[50 55 60 65 70 75 80 85 90 95 100];
ro2=[988.07 985.73 983.24 980.59 977.81 974.89 971.83 968.65 965.34 961.92 958.38];
%%Khoi luong rieng nuoc nong tr11ST1
if ttb_nong<=50
    ro_nong=interp1(t_ro1,ro1,ttb_nong);
else
    ro_nong=interp1(t_ro2,ro2,ttb_nong);
end
%% ---------LAMDA------------
t_lamda=[0	10	20	30	40	50	60	70	80	90	100	110	120	130	140	150	160	170	180	190 200];
gtr_lamda=[47.4	49.4	54.5	53.1	54.5	55.7	56.7	57.4	58	58.5	58.7	58.9	59	59	58.9	58.8	58.7	58.4	58	57.6	57];
lamda_nong=interp1(t_lamda,gtr_lamda,ttb_nong)*1.163*10^(-2);%W/m.k trang133ST1
%% ----------MUY--------------------------
t_muy=[30 31 32	33 34 35 36 37 38 39 40	41 42 43 44	45 46 47 48	49 50 51 52	53 54 55 56	57 58 59 60	61 62 63 64	65 66 67 68	69 70 71 72	73 74 75 76	77 78 79 80	81 82 83 84	85 86 87 88 89 90 91 92 93 94 95 96	97 98 99 100];
gtr_muy=[0.8007 0.0784 0.7679 0.7523 0.7371	0.7225 0.7085 0.6947 0.6814	0.6685 0.656 0.6439 0.6321 0.6207 0.6097 0.5988 0.5883 0.5782 0.5683 0.5588	0.5494 0.5404 0.5315 0.5229	0.5146 0.5064 0.4985 0.4907 0.4832 0.4759 0.4688 0.4618	0.455 0.4483 0.4418 0.4355 0.4293 0.4233 0.4174 0.4117 0.4061 0.4006 0.3952 0.39 0.3849 0.3799 0.375 0.3702 0.3655 0.361 0.3565 0.3521 0.3478 0.3436 0.3478 0.3355 0.3315 0.3276 0.3239 0.3202 0.3165 0.313 0.3095 0.306 0.3027 0.2994 0.2962 0.293	0.2899 0.2868 0.2838];
muy_nong=interp1(t_muy,gtr_muy,ttb_nong)*10^(-3);%N/s.m2 trang95ST1
%% -------------Cp-------------------
t_cp =[0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	65	66	67	68	69	70	71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100];
gtr_cp=[1.00803	1.00717	1.00636	1.00564	1.00495	1.00433	1.00378	1.00325	1.00277	1.00234	1.00194	1.00158	1.00124	1.00093	1.00067	1.00041	1.00019	0.99998	0.99978	0.99962	0.99947	0.99933	0.99921	0.99912	0.99902	0.99892	0.99885	0.99878	0.99873	0.99869	0.99866	0.99864	0.99861	0.99861	0.99859	0.99859	0.99861	0.99861	0.99864	0.99866	0.99869	0.99871	0.99876	0.9988	0.99883	0.9989	0.99895	0.999	0.99907	0.99912	0.99919	0.99926	0.99935	0.99943	0.9995	0.99959	0.99969	0.99978	0.99988	0.99998	1.00007	1.00019	1.00029	1.00041	1.00053	1.00065	1.00079	1.00091	1.00105	1.00117	1.00131	1.00146	1.0016	1.00177	1.00191	1.00208	1.00225	1.00241	1.00258	1.00277	1.00294	1.00313	1.00332	1.00351	1.00373	1.00392	1.00414	1.00435	1.00457	1.0048	1.00502	1.00526	1.0055	1.00574	1.006	1.00626	1.00653	1.00684	1.00705	1.00734	1.00763];
cp_nong=interp1(t_cp,gtr_cp,ttb_nong)*4.1868;%J/kg.k nhiet dung rieng nuoc nong tr165ST1
%% -------------efxilong------------
efxilong_nong=1;%tr15/ST2
efxilong_lanh=1;%tr15/ST2
%% TINH LUU LUONG - TOC DO
%-----------------------%
d=(dk_trong-2*bd_trong);%(m)duong kinh ong trong
D=(dk_ngoai-2*bd_ngoai);%(m)duong kinh ong ngoai
%-----------------------%
G_lanh = (ro_lanh*F_lvao*10^(-3))/60;%kg/s luu luong khoi luong
Q_lanh = G_lanh*cp_lanh*(t_lr-t_lv);%W
Q_nong = 1.1*Q_lanh;%W
G_nong = Q_nong/(cp_nong*(t_nv-t_nr));%kg/s luu luong khoi luong
F_nvao =(G_nong/ro_nong);%m3/s luu luong the tich
%-----------------------%
F_trong = (pi*d^2)/4;%m2 tiet dien ong trong
F_ngoai =((pi*D^2)/4)-F_trong;%m2 tiet dien ong ngoai
w_lanh =(F_lvao*10^(-3))/(F_ngoai*60);%m/s toc do dong nong
w_nong =(F_nvao/F_trong);%m/s toc do dong lanh
%-----------------------%
Dtd_nong = d;%duong kinh tuong duong ong trong
Dtd_lanh =(D-dk_trong);%duong kinh tuong duong ong ngaoi
%-----------Re------------%

Re_lanh =(w_lanh*Dtd_lanh*ro_lanh)/muy_lanh;
%-----------Pr----------------%
Pr_nong=(cp_nong*muy_nong*ro_nong)/lamda_nong;
Pr_lanh=(cp_lanh*muy_lanh*ro_lanh)/lamda_lanh;
%% --------------TINH LAP --------------%
format long
x = t_lv+1 ;
sai_so = 0.1;%
chu_so_dung = 10^(-2);
f = 0;
while true
    if x<=50
    ro_tv1=interp1(t_ro1,ro1,x);
    else
    ro_tv1=interp1(t_ro2,ro2,x);
    end
    lamda_tv1=interp1(t_lamda,gtr_lamda,x)*1.163*10^(-2);%W/m.k 
    muy_tv1=interp1(t_muy,gtr_muy,x)*10^(-3);%N/s.m2 
    Re_tv1 =(w_nong*Dtd_nong*ro_tv1)/muy_tv1;
    cp_tv1=interp1(t_cp,gtr_cp,x)*4.1868;%J/kg.k 
    Prt=(cp_tv1*muy_tv1*ro_tv1)/lamda_tv1;
    Pr_tv1=(cp_tv1*muy_tv1*ro_tv1)/lamda_tv1;
    Nu_tv1=0.021*efxilong_nong*Re_tv1^(0.8)*Pr_tv1^(0.43)*(Pr_tv1/Pr_tv1)^0.25;%Re>10000
    alpha1=(Nu_tv1*lamda_tv1)/Dtd_nong; %Nu=(a*dtd)/lamda tr11/ST2
    q1=alpha1*(t_nv-x);
    %--------------tim tv2--------------
    tv2= x-((q1*bd_trong)/lamda_vach);%dau
    ro_tv2=interp1(t_dau,ro_dau,tv2);
    cp_tv2=interp1(t_dau,cp_dau,tv2);
    muy_tv2=interp1(t_dau,muy_dau,tv2)*10^(-3);
    lamda_tv2=interp1(t_dau,lamda_dau,tv2);%W/m.k 
    Re_tv2 =(w_lanh*Dtd_lanh*ro_tv2)/muy_tv2;
    Pr_tv2=(cp_tv2*muy_tv2*ro_tv2)/lamda_tv2;
    Nu_tv2=0.23*Re_tv2^(0.8)*Pr_tv2^(0.4)*(Dtd_lanh/Dtd_nong)^0.45;
    %Nu_tv2=0.021*efxilong_lanh*Re_tv2^(0.8)*Pr_tv2^(0.43)*(Pr_tv2/Pr_tv2)^0.25;
    alpha2=(Nu_tv2*lamda_tv2)/Dtd_lanh;
    q2=alpha2*(tv2-t_lv);
    %so sanh
    error = (abs(q1-q2)*100)/q1;%;
    if error < sai_so
        f;
        tv1 = x;
        tv2;
        K = 1/((1/alpha1)+(1/alpha2)+(bd_trong/lamda_tv2));
        Q=q1;
        F = Q/(K*delta_tlog);
        L = F/(pi*dk_trong);
        fprintf('Tv1: %4.2f oC\n',tv1)
        fprintf('Tv2: %4.2f oC\n',tv2)
        fprintf('LUU LUONG DAU VAO: %4.2f L/ph\n',F_lvao)
        fprintf('LUU LUONG NUOC NONG VAO: %4.2f L/ph\n',F_nvao*60*10^(3))
        fprintf('BE MAT TRUYEN NHIET: %4.2f m2\n',F)
        fprintf('TONG CHIEU DAI ONG: %4.2f m\n',L)
        fprintf('CHON CHIEU DAI ONG: %4.2f m\n',1.5)
        fprintf('SO ONG: %4.2f \n',L/1.5)
        img = imread('Heater_tube_in_tube.png');
        imshow(img);
        %disp('08/2020')
        break
    end

    x = x + chu_so_dung;
    f = f + 1;
    
end
clc
clear
disp('TINH SO BO THIET BI KHUAY DAU CO (PALM OIL)');
disp('THAN TRU, DAY NAP ELIP')
%% TINH KICH THUOC THIET BI
v_dd = input('The tich Dung dich khuay: ');
v_tb = v_dd/0.8;%He so chua day 0,8
fprintf('The tich TB: %4.2f m3\n',v_tb)
D = round(((24*v_tb)/(11*pi))^(1/3),1);
fprintf('Duong kinh TB: %4.2f m\n',D)
h1 = (7*D)/4;%than cao
fprintf('Chieu cao than h1: %4.2f m\n',h1)
h2 = D/4; %chieu cao day
fprintf('Chieu cao day h2: %4.2f m\n',h2)
h3 = h2;%chieu cao nap
fprintf('Chieu cao nap h3: %4.2f m\n',h3)
h4 = 0.5;%chan do
fprintf('Chieu cao chan do h4: %4.2f m\n',h4)
H = h1 +h2 +h3 + h4; %toan thiet bi
fprintf('Chieu cao TB: %4.2f m\n',H)
fprintf('Chieu cao toan TB: %4.2f m\n',H+0.3)
V_thuc = (11*pi*D^3)/24;
fprintf('The tich thuc TB: %4.2f m3\n',V_thuc)
%% TINH CANH KHUAY
disp('Chon loai canh khuay: chan vit, mai cheo, mo neo');
loai_canh_khuay = input('Chon canh khuay: ','s');
if (loai_canh_khuay == "chan vit")
    dk1 = 0.25*D;%chan vit Cac QT trong CN hoa chat thuc pham 2
    dk2 = 0.33*D;
    v1 = 3.8;%m/s toc do canh khuay (Bang 4.11 – p627 – ST1)
    v2 = 16;%m/s
end
if (loai_canh_khuay == "mai cheo")
    dk1 = 0.5*D;%chan vit Cac QT trong CN hoa chat thuc pham 2
    dk2 = 0.7*D;
    v1 = 1.5;%m/s toc do canh khuay (Bang 4.11 – p627 – ST1)
    v2 = 5;%m/s
end
if (loai_canh_khuay == "mo neo")
    dk1 = 0.86*D;%chan vit Cac QT trong CN hoa chat thuc pham 2
    dk2 = 0.94*D;
    v1 = 0.5;%m/s toc do canh khuay (Bang 4.11 – p627 – ST1)
    v2 = 4;%m/s
end
fprintf('D_khuay trong khoang: %4.2f m -%8.3f m\n',dk1,dk2)
dk = input('Chon D canh khay: ');
n1 = v1/(2*pi*(dk/2));%vong/s CAN CHUYEN m/s sang vong/s
n2 = v2/(2*pi*(dk/2));
fprintf('Toc do khuay: %4.2f -%8.3f vong/s\n',n1,n2)
n = input('Chon toc do khuay: ');
n_ck = input('So canh khuay: '); %so canh khuay
muy = 0.02368;%N.s/m2 DO NHOT DUNG DICH KHUAY
ro = 889; %kh/m3 % KHOI LUONG RIENG DUNG DICH KHUAY
re = round((ro*n*dk^2)/muy);
fprintf('Chuan so Re: %4.2f \n',re)
e_k = round(0.845*re^(-0.05),3);
fprintf('Chuan cong suat e_k: %4.2f \n',e_k)
N = round(e_k*n^(3)*dk^(5)*ro*n_ck,2); %ST2/tr626
fprintf('Cong suat tieu ton luc lam viec N: %4.2f \n',N)
N_g = round(0.9675*ro*n^(3)*dk^5,2);
fprintf('Cong suat quan tinh N_g: %4.2f \n',N_g)
N_c = N + N_g;
fprintf('Cong suat mo may N_c: %4.2f \n',N_c)
neta = 0.7;% hieu suat dong co
N_dc_lt = round(N_c/neta,2);
fprintf('Cong suat DC ly thuyet N_dc_lt: %4.2f \n',N_dc_lt)
N_dc = round(1.5*N_dc_lt,2); %chon hieu so 1.5
fprintf('Cong suat DC thuc N_dc: %4.2f \n',N_dc)
%disp('08/2020')
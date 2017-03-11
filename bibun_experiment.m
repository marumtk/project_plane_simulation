h = waitbar(0, 'progress');

num_freq = 91; %微分値の評価を行う際の投影パターンの種類(疎密)
freq_index = zeros(num_freq,1);
data_set = 60; %微分値の評価を行う平面の数
result_all = zeros(num_freq,data_set); %微分評価の結果を格納
Z_start = 700; %平面の初期位置
delta_z = 20; %平面の位置の刻み幅

%カメラのピクセル
camera_width = 640;
camera_height = 480;
%プロジェクタのピクセル
proj_width = 1024;

load ('Projector.mat')
load ('Calib_Results_basler.mat')
%プロジェクタの内部パラメタ行列
internal_proj = KK_p;
%カメラ座標系に対するプロジェクタ座標系のR,T
round_proj = R_p; 
translation_proj = T_p;
rt_proj = horzcat(round_proj,translation_proj);
%プロジェクタの透視投影行列
P_proj = internal_proj * rt_proj;

%カメラの内部パラメタ行列
internal_camera = KK;
%カメラの透視投影行列(もともとカメラ座標系をワールド座標にしているので，R=単位行列,T=0)
P_camera = horzcat(internal_camera,[0;0;0]);

%微分判定結果をresult_allに格納
for i = 1:num_freq
    freq_index(i) = 0.00001 + 0.000001*(i-1);
    result_all(i,:) = bibun_hantei(freq_index(i),data_set,delta_z,camera_width,camera_height,proj_width,P_proj,P_camera,Z_start); %位相接続が正しくできるような平面の位置を格納していく
    waitbar(i/num_freq)
end

figure;
colormap(gray);
caxis auto;
x = Z_start-(data_set-2)*delta_z/2:delta_z:Z_start+data_set*delta_z/2; %平面の位置
y = 0.00001:0.000001:0.0001; %投影パターンの二次の係数
contourf(x,y,result_all);

title('微分評価','FontSize',16);
set(gca,'FontSize',16);
xlabel('カメラに対する平面の位置(mm)')
ylabel('投影パターンの二次の係数')
hold on
plot(Z_start*ones(1,num_freq),y,'r');
saveas(gcf,'bibun_hyoka.fig')
%%白い部分が計測可能領域  
close(h)
h = waitbar(0, 'progress');

num_freq = 91; %�����l�̕]�����s���ۂ̓��e�p�^�[���̎��(�a��)
freq_index = zeros(num_freq,1);
data_set = 60; %�����l�̕]�����s�����ʂ̐�
result_all = zeros(num_freq,data_set); %�����]���̌��ʂ��i�[
Z_start = 700; %���ʂ̏����ʒu
delta_z = 20; %���ʂ̈ʒu�̍��ݕ�

%�J�����̃s�N�Z��
camera_width = 640;
camera_height = 480;
%�v���W�F�N�^�̃s�N�Z��
proj_width = 1024;

load ('Projector.mat')
load ('Calib_Results_basler.mat')
%�v���W�F�N�^�̓����p�����^�s��
internal_proj = KK_p;
%�J�������W�n�ɑ΂���v���W�F�N�^���W�n��R,T
round_proj = R_p; 
translation_proj = T_p;
rt_proj = horzcat(round_proj,translation_proj);
%�v���W�F�N�^�̓������e�s��
P_proj = internal_proj * rt_proj;

%�J�����̓����p�����^�s��
internal_camera = KK;
%�J�����̓������e�s��(���Ƃ��ƃJ�������W�n�����[���h���W�ɂ��Ă���̂ŁCR=�P�ʍs��,T=0)
P_camera = horzcat(internal_camera,[0;0;0]);

%�������茋�ʂ�result_all�Ɋi�[
for i = 1:num_freq
    freq_index(i) = 0.00001 + 0.000001*(i-1);
    result_all(i,:) = bibun_hantei(freq_index(i),data_set,delta_z,camera_width,camera_height,proj_width,P_proj,P_camera,Z_start); %�ʑ��ڑ����������ł���悤�ȕ��ʂ̈ʒu���i�[���Ă���
    waitbar(i/num_freq)
end

figure;
colormap(gray);
caxis auto;
x = Z_start-(data_set-2)*delta_z/2:delta_z:Z_start+data_set*delta_z/2; %���ʂ̈ʒu
y = 0.00001:0.000001:0.0001; %���e�p�^�[���̓񎟂̌W��
contourf(x,y,result_all);

title('�����]��','FontSize',16);
set(gca,'FontSize',16);
xlabel('�J�����ɑ΂��镽�ʂ̈ʒu(mm)')
ylabel('���e�p�^�[���̓񎟂̌W��')
hold on
plot(Z_start*ones(1,num_freq),y,'r');
saveas(gcf,'bibun_hyoka.fig')
%%�����������v���\�̈�  
close(h)
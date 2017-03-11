function [a_real,b_real] = plane_simulation(Z_start,freq,camera_width,camera_height,proj_width,P_proj,P_camera)
%�J�����̉��s�����̏����ʒu��Z_start�Ƃ���
temp_Zposition = Z_start*P_camera(1:3,3);
temp1 = P_camera(1:3,1:2);
temp2 = P_camera(1:3,4);
temp3 = P_proj(3,1:4);
camera_map = zeros(camera_width,camera_height,3); %�J�����s�N�Z�����Ƃɐ��E���W���v�Z
cam_proj_correspond = zeros(camera_height,camera_width,3); %�J�����ƃv���W�F�N�^�̃s�N�Z���̑Ή����擾

for u_camera = 1:camera_width
    for v_camera = 1:camera_height
        %�J�����s�N�Z�����Ƃɐ��E���W���v�Z
        pixel_camera = [u_camera;v_camera;1];
        A = horzcat(-temp1,pixel_camera);
        camera_map(u_camera,v_camera,:) = A\(temp_Zposition+temp2);
        camera_map(u_camera,v_camera,3) = Z_start;
        
        %�J�����ƃv���W�F�N�^�̃s�N�Z���̑Ή����擾
        %�������W�n��p���ăv���W�F�N�^�s�N�Z�����v�Z
        cam_proj_correspond(v_camera,u_camera,:) = P_proj*vertcat( reshape(camera_map(u_camera,v_camera,:),[3,1]) , 1 );
        B = temp3*vertcat( reshape(camera_map(u_camera,v_camera,:),[3,1]) , 1 );
        cam_proj_correspond(v_camera,u_camera,:) = cam_proj_correspond(v_camera,u_camera,:)/B;
    end
end


%�J�����s�N�Z�����Ƃ̐�Έʑ�
cam_phase = cam_proj_correspond(:,:,1).^2*freq;
%�v���W�F�N�^�̃s�N�Z�����͈̔͊O�̂��̂ɑ΂��Ă̓f�[�^���珜�O
cam_phase(cam_proj_correspond(:,:,1)<1) = 10000;
cam_phase(proj_width<cam_proj_correspond(:,:,1)) = 10000;


%�ʑ��̔����l���s�N�Z�����ƂɊi�[
diff_phase = zeros(camera_height,camera_width-1);
%�ʑ��̔����̉�A���J�����s�N�Z���̍s���ƂɊi�[
p = zeros(camera_height,2);

for v_camera = 1:camera_height
    num = 1;
    for u_camera = 1:camera_width-1
        %�ʑ��̔����̐��f�[�^
        diff_phase(v_camera,u_camera) = cam_phase(v_camera,u_camera+1)-cam_phase(v_camera,u_camera);
    end
    %�ʑ��̔����̊O��l����
    differ_temp = zeros(2,camera_width-1);
    for i = 1:camera_width-1
        if diff_phase(v_camera,i)>0 && diff_phase(v_camera,i)<1000
            differ_temp(1,num) = i;
            differ_temp(2,num) = diff_phase(v_camera,i);
            num = num+1;
        end
    end
    p(v_camera,:) = polyfit(differ_temp(1,1:num-1),differ_temp(2,1:num-1),1);
end
a_real = mean(p(:,1));
b_real = mean(p(:,2));

end


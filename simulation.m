clear;
nm=1e-9;um=1e-6;mm=1e-3;
lambda=520*nm;
p=8*um;
z=100*mm;
M=1200;
N=1920;
intensity_input=ones(M,N); 
phase=importdata('C:\Users\chennian\Desktop\program\MATLAB_myself\phase retrieval\result\6_GS.mat');
phase=phase(:,:,2);
image=imread('GT_6.png');
% phase=im2double(phase); 
% phase=phase*2*pi;                               
% phase(phase>pi)=phase(phase>pi)-2*pi;   
complex=intensity_input.*exp(1i*phase);
I= propagation_PSF(complex,z,p,lambda,'AS');
I=I/max(max(I));
% PSNR1=PSNR(I,image(:,:,2));
% SSIM2=SSIM(I,image(:,:,2));
% char=['PSNR=',num2str(PSNR1),'    ','SSIM=',num2str(SSIM1)];
% figure(1),subplot(1,2,1),imshow(phase,[]),title('the phase of the hologram');
figure(1),imshow(I),title('the result');

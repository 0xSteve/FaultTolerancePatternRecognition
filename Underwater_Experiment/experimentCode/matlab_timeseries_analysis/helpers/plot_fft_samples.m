function plot_fft(f_vec, fft, fft_title, delay)
    
    if(exist('delay', 'var'))
        for i = 1:length(fft(1,:))
            fprintf('Sample number: %d \n',i);
            muh_title = [fft_title ': Sample ' num2str(i)];
            plot_fft(f_vec, fft(:,i), muh_title, 'Frequency (kHz)', 'Magnitude')
            pause(delay);
            close;
        end
    else
        for i = 1:length(fft(1,:))
            muh_title = [fft_title ': Sample ' num2str(i)];
            plot_fft(f_vec, fft(:,i), muh_title, 'Frequency (kHz)', 'Magnitude')
        end
    end
end
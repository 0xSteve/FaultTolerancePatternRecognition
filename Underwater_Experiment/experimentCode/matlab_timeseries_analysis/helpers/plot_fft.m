function plot_fft(f_vec, fft, fft_title, fft_xlabel, fft_ylabel)
    figure
    plot(f_vec, fft)
    if(exist('fft_title', 'var'))
        title(fft_title);
    end
    if(exist('fft_xlabel', 'var'))
        xlabel(fft_xlabel);
    else
        xlabel('Frequency (kHz)');
    end
    if(exist('fft_ylabel', 'var'))
        ylabel(fft_ylabel);
    else
        ylabel('Magnitude');
    end
end
function plot_nonzero_pdf(X, Y, len, muh_title, muh_datum, unit)

    if (~exist('muh_datum', 'var'))
        muh_datum = 'x';
    end
    if (~exist('muh_title', 'var'))
        muh_title = 'plot';
    end
     if (~exist('unit', 'var'))
        unit = 'unit';
    end
    pdf = average_pdf(Y, len);
    threshold = max(abs(pdf))/10000; %tolerance threshold
    pdf2 = pdf;
    pdf2(abs(pdf)<threshold) = 0;
    pdf = pdf2;
    pdf = nonzeros(pdf);
    minimum = min(X);
    maximum = max(X);
    X = linspace(minimum, maximum, len);
    X = X(1:length(pdf));
    figure
    stem(X, pdf)
end
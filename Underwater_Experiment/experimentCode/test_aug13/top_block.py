#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Top Block
# Generated: Tue Sep 18 14:53:18 2018
##################################################

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"

from PyQt4 import Qt
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import fft
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.eng_option import eng_option
from gnuradio.fft import window
from gnuradio.filter import firdes
from optparse import OptionParser
import sip
import sys
from gnuradio import qtgui


class top_block(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Top Block")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Top Block")
        qtgui.util.check_set_qss()
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
            pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 44100
        self.trans_num = trans_num = str(2)
        self.send_loc = send_loc = str(2)
        self.freq = freq = 1200
        self.fft_size = fft_size = samp_rate/14
        self.phase_delay_stream = phase_delay_stream = 1
        self.path = path = "/home/me/git/ft_pr/Underwater_Experiment/lake-trial-august13-2018/"
        self.file_name = file_name = "sendloc" + send_loc + "_trans" + trans_num + "_laketrial_aug13_2018"
        self.bin_number = bin_number = (freq*fft_size)/samp_rate

        ##################################################
        # Blocks
        ##################################################
        self.qtgui_sink_x_0 = qtgui.sink_c(
        	fft_size, #fftsize
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	0, #fc
        	samp_rate, #bw
        	"", #name
        	True, #plotfreq
        	True, #plotwaterfall
        	True, #plottime
        	True, #plotconst
        )
        self.qtgui_sink_x_0.set_update_time(1.0/10)
        self._qtgui_sink_x_0_win = sip.wrapinstance(self.qtgui_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_grid_layout.addWidget(self._qtgui_sink_x_0_win)

        self.qtgui_sink_x_0.enable_rf_freq(True)



        self.fft_vxx_0 = fft.fft_vcc(fft_size, True, (window.blackmanharris(fft_size)), True, 1)
        self.blocks_wavfile_source_0 = blocks.wavfile_source(path + file_name + ".wav", False)
        self.blocks_vector_to_stream_0_0 = blocks.vector_to_stream(gr.sizeof_float*1, fft_size)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_float*1, samp_rate,True)
        self.blocks_stream_to_vector_0 = blocks.stream_to_vector(gr.sizeof_gr_complex*1, fft_size)
        self.blocks_skiphead_0_0 = blocks.skiphead(gr.sizeof_float*1, bin_number + 1)
        self.blocks_keep_one_in_n_0_0 = blocks.keep_one_in_n(gr.sizeof_float*1, fft_size)
        self.blocks_float_to_complex_0 = blocks.float_to_complex(1)
        self.blocks_file_sink_1_0 = blocks.file_sink(gr.sizeof_float*1, path + "main_lobe_dat/"  + file_name + "_main_lobe_ang_pure.dat", False)
        self.blocks_file_sink_1_0.set_unbuffered(True)
        self.blocks_complex_to_arg_0 = blocks.complex_to_arg(fft_size)



        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_complex_to_arg_0, 0), (self.blocks_vector_to_stream_0_0, 0))
        self.connect((self.blocks_float_to_complex_0, 0), (self.blocks_stream_to_vector_0, 0))
        self.connect((self.blocks_float_to_complex_0, 0), (self.qtgui_sink_x_0, 0))
        self.connect((self.blocks_keep_one_in_n_0_0, 0), (self.blocks_file_sink_1_0, 0))
        self.connect((self.blocks_skiphead_0_0, 0), (self.blocks_keep_one_in_n_0_0, 0))
        self.connect((self.blocks_stream_to_vector_0, 0), (self.fft_vxx_0, 0))
        self.connect((self.blocks_throttle_0, 0), (self.blocks_float_to_complex_0, 0))
        self.connect((self.blocks_vector_to_stream_0_0, 0), (self.blocks_skiphead_0_0, 0))
        self.connect((self.blocks_wavfile_source_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.fft_vxx_0, 0), (self.blocks_complex_to_arg_0, 0))

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.set_fft_size(self.samp_rate/14)
        self.set_bin_number((self.freq*self.fft_size)/self.samp_rate)
        self.qtgui_sink_x_0.set_frequency_range(0, self.samp_rate)
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)

    def get_trans_num(self):
        return self.trans_num

    def set_trans_num(self, trans_num):
        self.trans_num = trans_num
        self.set_file_name("sendloc" + self.send_loc + "_trans" + self.trans_num + "_laketrial_aug13_2018")

    def get_send_loc(self):
        return self.send_loc

    def set_send_loc(self, send_loc):
        self.send_loc = send_loc
        self.set_file_name("sendloc" + self.send_loc + "_trans" + self.trans_num + "_laketrial_aug13_2018")

    def get_freq(self):
        return self.freq

    def set_freq(self, freq):
        self.freq = freq
        self.set_bin_number((self.freq*self.fft_size)/self.samp_rate)

    def get_fft_size(self):
        return self.fft_size

    def set_fft_size(self, fft_size):
        self.fft_size = fft_size
        self.set_bin_number((self.freq*self.fft_size)/self.samp_rate)
        self.blocks_keep_one_in_n_0_0.set_n(self.fft_size)

    def get_phase_delay_stream(self):
        return self.phase_delay_stream

    def set_phase_delay_stream(self, phase_delay_stream):
        self.phase_delay_stream = phase_delay_stream

    def get_path(self):
        return self.path

    def set_path(self, path):
        self.path = path
        self.blocks_file_sink_1_0.open(self.path + "main_lobe_dat/"  + self.file_name + "_main_lobe_ang_pure.dat")

    def get_file_name(self):
        return self.file_name

    def set_file_name(self, file_name):
        self.file_name = file_name
        self.blocks_file_sink_1_0.open(self.path + "main_lobe_dat/"  + self.file_name + "_main_lobe_ang_pure.dat")

    def get_bin_number(self):
        return self.bin_number

    def set_bin_number(self, bin_number):
        self.bin_number = bin_number


def main(top_block_cls=top_block, options=None):

    from distutils.version import StrictVersion
    if StrictVersion(Qt.qVersion()) >= StrictVersion("4.5.0"):
        style = gr.prefs().get_string('qtgui', 'style', 'raster')
        Qt.QApplication.setGraphicsSystem(style)
    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()
    tb.start()
    tb.show()

    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()


if __name__ == '__main__':
    main()

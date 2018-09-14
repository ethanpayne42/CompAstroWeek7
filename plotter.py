import numpy as np
import matplotlib.pyplot as plt
import sys

# Imports for plotting
import matplotlib as mpl
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

def file_str(istep):
    return 'output_'+str(istep)+'.dat'

params = {
   'axes.labelsize': 18,
   'font.size': 24,
   'legend.fontsize': 18,
   'xtick.labelsize': 18,
   'ytick.labelsize': 18,
   'axes.titlesize':18,
   'text.usetex': True,
   'figure.figsize': [6, 6/1.618],
   'font.family':'sans',
   'font.serif':'DejaVu'
   }
mpl.rcParams.update(params)

dir = 'data/'

i_s = ['00020', '00040','00060','00080','00100']
for i in i_s:
    file = file_str(i)
    data = np.genfromtxt(dir+file)
    xs = data[1:,0]
    us = data[1:,1]
    t = data[0,0]

    plt.plot(xs, us)
    plt.xlim(0,1)
    plt.ylim(-2,2)
    plt.xlabel(r'$x$')
    plt.ylabel(r'$u(x,t)$')
    plt.title(r'solution at $t={}$'.format(np.round(t,2)))
    #plt.tight_layout()
    plt.show()
    #plt.savefig('../code_document/comb_boxe_{}.pdf'.format(i), bbox_inches='tight')
    plt.clf()

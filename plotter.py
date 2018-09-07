import numpy as np
import matplotlib.pyplot as plt

# Imports for plotting
import matplotlib as mpl
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

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

files = ['output_00000.dat', 'output_00040.dat','output_00100.dat',
         'output_00200.dat']

for i, file in enumerate(files):

    data = np.genfromtxt(file)
    xs = data[1:,0]
    us = data[1:,1]
    t = data[0,0]

    plt.plot(xs, us)
    plt.xlim(0,1)
    plt.ylim(-0.05,1.5)
    plt.xlabel(r'$x$')
    plt.ylabel(r'$u(x,t)$')
    plt.title(r'solution at $t={}$'.format(np.round(t,2)))
    plt.tight_layout()
    plt.savefig('../code_document/lax_t{}.pdf'.format(i))
    plt.clf()

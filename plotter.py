import numpy as np
import matplotlib.pyplot as plt
import sys

# Imports for plotting
import matplotlib as mpl
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

def file_str(choice, t):
    return 'output_'+str(choice)+'_'+str(t)+'.dat'

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

choices = np.array(sys.argv[1:],dtype=int)

dir = 'data/'

ts = ['00000', '00200','00400','00600','00800','01000']

for i, ti in enumerate(ts):
    for choice in choices:
        if choice == 2:
            label = 'Upwind'
        elif choice == 3:
            label = 'L-W'
        else:
            label = None

        file = file_str(choice, ti)
        data = np.genfromtxt(dir+file)
        xs = data[1:,0]
        us = data[1:,1]
        t = data[0,0]

        plt.plot(xs, us, label=label)
        plt.xlim(0,1)
        plt.ylim(-2,2)
        plt.xlabel(r'$x$')
        plt.ylabel(r'$u(x,t)$')
        if i == 0:
            plt.legend(loc='best')
        plt.title(r'solution at $t={}$'.format(np.round(t,2)))
        #plt.tight_layout()
    plt.show()
    #plt.savefig('../code_document/comb_boxe_{}.pdf'.format(i), bbox_inches='tight')
    plt.clf()

for choice in choices:
    if choice == 2:
        label = 'Upwind'
    elif choice == 3:
        label = 'L-W'
    else:
        label = None

    file = file_str(choice, ti)
    data = np.genfromtxt(dir+file)
    xs = data[1:,0]
    us = data[1:,1]
    t = data[0,0]

    file2 = file_str(choice, '00000')
    data2 = np.genfromtxt(dir+file2)
    xs2 = data2[1:,0]
    us2 = data2[1:,1]
    t2 = data2[0,0]
    plt.plot(xs, us-us2, label=label)
    plt.xlim(0,1)
    plt.ylim(-1e-33,1e-33)
    plt.xlabel(r'$x$')
    plt.ylabel(r'$u(x,1) - u(x,0)$')
    plt.legend(loc='best')
    plt.title(r'error')

plt.show()
#plt.savefig('../code_document/error.pdf', bbox_inches='tight')

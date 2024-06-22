import React from 'react'

export default function Footer() {
  return (
    <div>

        <footer class="py-5 bg-black">
            <div class="container px-5">
              <div className='row justify-content-evenly align-items-center'>
                <div className='col'>
                  <p className='m-1 lead text-center text-white'>In theaters</p>
                  <p className='m-1 lead text-center text-white'>Soon</p>
                  <p className='m-1 lead text-center text-white'>Sinemalar</p>
                </div>
                <div className='col'>
                  <p className='m-1 lead text-center text-white'>E-Bilet</p>
                  <p className='m-1 lead text-center text-white'>Return Procedures</p>
                  <p className='m-1 lead text-center text-white'>Sales Contract</p>
                </div>
              </div>
              <p class="mt-5 text-center text-white small">
                <strong>
                   Copyright &copy; CineVision 2022
                </strong> 
              </p>
            </div>
        </footer>

    </div>
  )
}

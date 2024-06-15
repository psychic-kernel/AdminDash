using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI_1.Models;
namespace WebAPI_1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly ShopContext _context;

        public ProductsController(ShopContext context)
        {
            _context = context;
            _context.Database.EnsureCreated();
        }


        [HttpGet]
        public async Task<ActionResult> GetAllProducts()
        {
            return Ok(await _context.Products.ToArrayAsync());
        }

        // [HttpGet, Route("{id}")]
        [HttpGet("{id}")]
        public async Task<ActionResult> GetProducts(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if(product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }
        /*[HttpGet]
        public ActionResult<Product> GetAllProducts()
        {
            return Ok(_context.Products.ToArray());
        }*/
        /*[HttpGet] // Same thing
        public ActionResult <IEnumerable<Product>> GetAllProducts()
        {
            return Ok(_context.Products.ToArray());
        }*/

        /*[HttpGet, Route("/products/{id}")]
        public IActionResult GetProduct(int id)
        {
            var product = _context.Products.Find(id);

            if(product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }*/

        // Get available products
        [HttpGet("available")]
        public async Task<ActionResult<IEnumerable<Product>>> GetAvailableProducts()
        {
            return Ok(await _context.Products.Where(p => p.IsAvailable).ToArrayAsync());
        }

        [HttpPost]
        public async Task<ActionResult> PostProduct(Product product)
        {

            if (!ModelState.IsValid)
                return BadRequest();

            _context.Products.Add(product);

            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetProducts), new { id = product.Id }, product);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutProduct(int id, Product product)
        {
            if(id != product.Id)
                return BadRequest();

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!_context.Products.Any(p => p.Id == id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            
            return NoContent();
        }

        [HttpDelete("{id}")]
        //public async Task<ActionResult> DeleteProduct(int id) // SAME 
        public async Task<ActionResult> DeleteProduct([FromRoute] int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync(); // persist changes to the data.

            return Ok(product);
        }

        [HttpPost("Delete")]
        public async Task<ActionResult> DeleteMultiple([FromQuery] int[] ids)
        {
            /*var products = await _context.Products.Where(p => ids.Contains(p.Id)).ToArrayAsync();
            if (products.Length == 0)
            {
                return NotFound();
            }
            foreach (var product in products)
            {
                _context.Products.Remove(product);
            }
            await _context.SaveChangesAsync();

            return Ok(products);*/
            var products = new List<Product>();
            foreach(var id in ids)
            {
                var product = await _context.Products.FindAsync(id);

                if(product == null)
                {
                    return NotFound();
                }
                products.Add(product);
            }
            _context.Products.RemoveRange(products);
            await _context.SaveChangesAsync();
            return Ok(products);
        }

    }
}
